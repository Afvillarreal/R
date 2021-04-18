rm(list=ls()) 

getwd()

# Definir directorio de trabajo.
#===============================================================================



# PREPROCESADO DE DATOS - PARTE 3
#===============================================================================

library(dplyr)

#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- join_type

# En muchos anÃ¡lisis de datos se requiere de la uniÃ³n de dos o 
# mÃ¡s bases de datos.

# Sintaxis general para la uniÃ³n de bases de datos. 
# join_type(Data1, Data2, by= key)

# Cargar las bases Data 1 y Data 2

setwd("C:/Users/felipe/Desktop/Curso R/sesion 6")

library(readxl)
Data1 <- read_excel("C:/Users/felipe/Desktop/Curso R/sesion 6/Data1.xlsx")
View(Data1)

library(readxl)
Data2 <- read_excel("C:/Users/felipe/Desktop/Curso R/sesion 6/Data2.xlsx")
View(Data2)

#Union interna (inner_join)

Data_inner = inner_join(Data1,Data2,by="Customer_ID")
Data_inner


#Union a la izquierda (left_join)

Data_left = left_join(Data1,Data2,by="Customer_ID")
Data_left

#Union derecha (right_join)
Data_right = right_join(Data1,Data2,by="Customer_ID")
Data_right

#Union completa (full_join)
Data_full = full_join(Data1,Data2,by="Customer_ID")
Data_full

#Semi union (semi_join)
Data_semi = semi_join(Data1,Data2,by="Customer_ID")
Data_semi

#Anti Union (anti_join)

Data_semi = anti_join(Data1,Data2,by="Customer_ID")
Data_semi


# La funcion merge(), rbind(), cbind()

x <- data.frame(id = 1:4, año = 1995:1998)
x

x1 <- data.frame(id = 5:10, año = 1999:2004)
x1

y <- data.frame(id = c(4, 1, 3, 2),
                año = c(1998, 1995, 1997, 1996),
            edad = c(22, 25, 23, 24))
y

z <- data.frame(id = c(1, 2, 3),
                año = 1995:1997,
                salario = c(1000, 1200, 1599))
z

x;y
merge(x,y)
merge(z,merge(x,y))
merge(z,merge(x,y, all = T),all = T)

rbind(x,x1)

cbind(x,y)

#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- Manipular fechas 


# El paquete lubridate nos facilita el tratamiento de fechas
# en R, Ãºtil entre otras cosas para preparar nuestros datos 
# antes de un estudio.

# Cargar libreria
library(lubridate)


# El formato estÃ¡ndar de fecha (ISO 8601) se corresponde 
# con YYYY-MM-DD, asi como el de hora HH:MM:SS.
# Encontramos dos tipos de objeto:
# POSIXlt â lista con componentes (year, month, dayâ¦)
# POSIXct â segundos desde 1970-01-01 00:00:00


# Obtener la fecha actual desde R
today()
# Obtener la fecha y hora actual desde R
now()

# ymd() transforma una fecha (aÃ±o-mes-dÃ­a) almacenada en un 
# vector numÃ©rico o caracter en un objeto fecha 
str(Data1)
ymd(Data1$Date,tz="America/Bogota")

# unificando formatos.

b1 = c("01312021")
mdy(b1)
b2 = c("01/2021/31")
myd(b2)
b3 = c("01 enero 2021")
dmy(b3)
b4 = c("08-2015-Agosto")
dym(b4)

# Secuencia de fechas

s1 = seq(Sys.Date(),length.out=10,by="1 day");s1

dias = s1[5]-s1[1];dias

saveRDS(Base,file="Base2.rds")


