#Autor:Andres Felipe Villarreal Reina- William Yecid Gutierrez
#universidad EAN

#definir directorio de trabajo
setwd("C:/Users/felipe/Desktop/Curso R")

# Cargar los datos - covid180421
library(readr)
Data = read.csv("covid180421.csv")
rm(COVID180421)

# A. ¿Cúantos casos positivos de COVID-19 han sido reportados
#por el Instituto Nacional de Salud enColombia?

dim(Data)
#respuesta: 2.652.947 casos positivos

# B. Que informacion se tiene de los casos reportados?
#Revisar las variables que tiene la base.

#Con este codigo podemos ver que informacion tiene de los casos resportados
Data[0,]

# C. Cual es la clase de la variable "ID de caso"?

class(Data$ID.de.caso)
#respuesta: entero

# D. La variable “ID de caso” denota una etiqueta,
# en tanto, no debe ser num ́erica.
# Escriba el c ́odigopara hacer que  ́esta variable sea tipo car ́acter.

as.character(Data$ID.de.caso)

# E.¿La base de datos es un tidy data? Explique su respuesta.

#respuesta: la base ya es tidy data, las variables esta en columna y cada 
#observación en una fila diferente.


# F. Separe  la  columna  “Fecha  de  diagn ́ostico”  en  tres  columnas  “D ́ıa”
#  “Mes”,  “A ̃no”.  Guarde  lo scambios en la base original



library(tidyr)
library(magrittr)
library(dplyr)

Data = Data %>% separate(`Fecha.de.diagnÃ³stico`, c("Dia","Mes","año"),sep="/")


# G.Unifique la columna “A ̃no”,
#debe aparecer solo 2020 o 2021, seg ́un corresponda. Guarde los cam-bios en la base original.

Data = Data %>% mutate(año= gsub("2020 0:00:00","2020",año), 
                       año = gsub("2021 0:00:00","2021",año))


# H. Escriba un c ́odigo que le permita, cambiar el nombre de las columnas “ID de caso”,
#“Nombre mu-nicipio”, “Nombre departamento” y
#“Nombre del pa ́ıs” por “ID”, “Municipio”, “Departamento”y “Procedencia”
#, respectivamente. Guarde los cambios en la base original.


Data = Data %>% rename(ID =`ID.de.caso` , Municipio= `Nombre.municipio`, Departamento= `Nombre.departamento`,
                      Procedencia = `Nombre.del.paÃ.s`)

# I.Convierta  la  variable  “Ubicaci ́on  del  caso”  a  tipo  factor. 
#¿Cu ́antos  casos  se  han  clasificado  encasa?

Data$`UbicaciÃ³n.del.caso`=as.factor(Data$UbicaciÃ³n.del.caso)
str(Data$`UbicaciÃ³n.del.caso`)
class(Data$`UbicaciÃ³n.del.caso`)

select(Data$UbicaciÃ³n.del.caso=Casa)
Data %>% select(Casa)
Data %>% summarise(Data$UbicaciÃ³n.del.caso)

Data2 = Data %>% filter(Data$UbicaciÃ³n.del.caso == "Casa")
dim(Data2)  

# j)  Haga un filtro que permita saber ¿Cu ́antas personas se han reportado mayores
#de 70 a ̃nos en laciudad de Bogot ́a o Medell ́ın? No guarde los cambios.NO
#TA: la ciudad se ubica en la variableMunicipio.

Data4 = Data %>% filter(Edad > 70 & (Municipio == "BOGOTA" | Municipio == "MEDELLIN" ) )
dim(Data4)

# K)Haga un filtro que le permita seleccionar las tres personas de mayor edad que
#han sido reportadas.No  guarde  los  cambios  en  la  base  original  y  
#describa  en  dos  l ́ıneas  las  caracter ́ısticas  de  esaspersonas

Data %>% top_n(3,Edad)



#L)Escriba un codigo que le permita conocer y describir las caracterısticas del individuo reportado
#como numero 100.

Data[100,]

#M) Escriba un codigo que le permita ordenar de menor a mayor por edad. No guarde los cambios en
#la base original.

Data %>% arrange(Edad)

#n) Escriba un c´odigo que le permita conocer solo el “Sexo” y “Procedencia” de los 10 primeros
#registros. En la mayorıa de los casos ¿cual fue la procedencia? No guarde los cambios en la base
#original.

(Data %>% select(Sexo,Procedencia))[1:10,]   
Data[0,]

#ñ) Agrupe por departamento y haga el conteo de casos ¿Cu´ales son los departamentos con menor
#numero de casos? No guarde los cambios en la base original.  

Data %>% group_by(Departamento) %>%
  summarise(Total=n())


#o) Agrupe por departamento y g´enero, haga el conteo de casos ¿Cu´ales son los departamentos donde
#la cantidad de hombre y mujeres reportadas es menor a 650? No guarde los cambios en la base
#original.


Data %>% group_by(Departamento, Sexo ) %>%
  summarise(Total=n()) %>%
  filter(Total< 650)


#p)  Construya una base de datos que se llame “Cun” para el Departamento de Cundinamarca que solo tenga la informaci ́on sobre el municipio, estado y tipo de contagio

library(tidyverse)

Cun= Data %>% group_by(Departamento=="CUNDINAMARCA") %>%
  select(c(Municipio, Estado,Tipo.de.contagio))


#q)  Exporte la base de datos “Cun” como un archivo de texto, es decir, .txt.

write.table(Cun, "Cun.txt")


#r)  Construya una base de datos que se llame “Ant” para el Departamento de Antioquia que contengael total de casos por municipio.


Ant = Data %>% filter(Departamento == "ANTIOQUIA")%>%
  group_by(Municipio)%>% 
  summarise(Total=n()) 



#s)  Exporte la base de datos “Ant” como un archivo .dta

write.table(Ant, "Ant.dta")


