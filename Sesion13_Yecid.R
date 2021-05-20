setwd("C:/Users/HP 14/Septimo semestre/Electiva R/SegundoCorte")
# GRÁFICOS BASE EN R
#===============================================================================

#Vamos a utilizar datos que se encuentran accesibles en el paquete AER. 
#Por tanto, se debe instalar y cargar la librería AER

library(AER)

data(package="AER")
#Ejercicio: Revisar el listado de datos que tiene el paquete 

#Ejercicio: La base de datos que utilizaremos para crear las gráficas
#es CPS1985. Visualizar la base de datos y revisar la información que tiene


data("CPS1985")
?CPS1985
dim(CPS1985)
names(CPS1985)
str(CPS1985)
head(CPS1985)
data= CPS1985
rm(CPS1985)
summary(data)
#Los graficos base de R se construyen con las funciones hist, plot, boxplot, etc.


#===============================================================================
#===============================================================================
# Gráficos para variables cuantitativas
#===============================================================================

#HISTOGRAMA
#Ejercicio: Utilizar la función hist() para construir un histograma 
# para la variable wage.
windows()
hist(data$wage)
?hist
#Función de densidad

windows()

hist(data$wage, breaks = 20,
     main = "Distribución del salario(dólares/hor)",
     xlab="Salario",
     ylab = "Numero de personas",
     xlim = c(0.50),
     ylim=c(0,140),
     col="turquoise4",
     border = "white")
lines(density(data$wage),col="yellow", col="red", lwd=5)
abline(v=mean(data$wage),lwd=2, lty=3, col="yellow")
abline(v=median(data$wage),lwd=2, lty=4, col="yellow")

#Ejercicio: Aplicar lo aprendido.
# 1. Crear una nueva variable, log(wage), que sea el logaritmo del salario (wage). 
# Construir el histograma de log(wage) y compararlo con el histograma de la variable original wage.

# ¿Qué conclusión puede extraerse?

library(magrittr)
library(tidyverse)
library(dplyr)

windows()
data = data %>%  mutate(logwage=log(wage))
hist(data$logwage, breaks = 20,
     main = "Distribución del salario(dólares/hor)",
     xlab="Salario",
     ylab = "Numero de personas",
     xlim = c(0.50),
     ylim=c(0,140),
     col="turquoise4",
     border = "white")
lines(density(data$logwage),col="yellow", col="red", lwd=3)
abline(v=mean(data$logwage),lwd=2, lty=3, col="yellow")
abline(v=median(data$logwage),lwd=2, lty=4, col="yellow")

# 2. Construir un histograma para ver la distribución de la 
# variable experiencia (experience).

library(magrittr)
library(tidyverse)
library(dplyr)

windows()
hist(data$experience, breaks = 10,
     main = "Experience",
     xlab="Años",
     ylab = "Numero de personas",
     xlim = c(0,50),
     ylim=c(0,60),
     col="turquoise4",
     border = "white")
lines(density(data$experience),col="yellow", col="red", lwd=5)
abline(v=mean(data$experience),lwd=2, lty=3, col="yellow")
abline(v=median(data$experience),lwd=2, lty=4, col="yellow")


#DIAGRAMA DE CAJA (boxplot)
#Ejercicio: Utilizar la función boxplot() para construir un histograma 
# para la variable wage.

#En los gráficos boxplot (o Box and Whiskers, más conocidos como Caja y Bigotes) 
#se representan cinco medidas (mínimo, cuartil 1, mediana, cuartil 3 y máximo), 
#lo que nos puede ayudar a hacernos una idea de la asimetría de la distribución. 
#Los gráficos de Caja y Bigotes también permiten detectar valores atípicos y outliers.

boxplot(data$wage)
#Cuales son los valores atipicos 
y= boxplot(data$wage)
y$stats

a=data$wage[data$wage > y$stats[5,1]];a
round(length(a)/dim(data)[1]*100,2)
(a1 = which(data$wage> y$stats[5,1]))
data[a1,]
#mejorar el grafico
windows()
boxplot(data$wage,
        main="Salario(dólares/hora)",
        ylab="Salario",
        col="blue",
        border="red")

#Ejercicio:Hacer un diagrama de caja para la variable "wage"
#discriminando por género.
class(data$gender)
boxplot(data$wage ~ data$gender)
windows()
boxplot(data$wage ~ data$gender,
        main="Salario según genero",
        ylab="Salario (dolares/hora)",
        names = c("Hombres", "Mujesres"),
        xlab="Genero")
       
#Incluir el salario medio en el diagrama de caja

data_mujeres= subset(data, gender="female")
data_hombres= subset(data, gender="male")

windows()
boxplot(data$wage ~ data$gender,
        main="Salario según genero",
        ylab="Salario (dolares/hora)",
        names = c("Hombres", "Mujesres"),
        xlab="Genero",
        horizontal= T)
points(mean(data_hombres$wage),1,pch=25,bg="red")
points(mean(data_mujeres$wage),2,pch=22,bg="blue")
#Ejercicio: Construir un diagrama de caja para el salario 
# según ocupación.


levesl(data$occupation)
#colores
a2 =rainbow(6)
b= rainbow(6,alpha = 0.2)
c <- rainbow(6, alpha=0.2)
windows()
boxplot(data$wage ~ data$occupation,
        col= c, 
        boxcol=c,
        medicol=c,
        whiskcol=a2,
        staplecol=c,
        outcol=c,
        outbg=c,
        pch=20,
        cex=1,
        
        main="Salario según ocupación",
        ylab="Salario (dolares/hora)",
        names = c("worker", "technical","services", "office", "sales","mangement"),
        xlab="Genero",
        horizontal= T)
points(mean(data_hombres$wage),1,pch=25,bg="red")
points(mean(data_mujeres$wage),2,pch=22,bg="blue")
points(mean(data_hombres$wage),1,pch=25,bg="red")
points(mean(data_mujeres$wage),2,pch=22,bg="blue")
points(mean(data_hombres$wage),1,pch=25,bg="red")




#===============================================================================
#===============================================================================
# Gráficos para variables cualitativas
#===============================================================================


#DIAGRAMA DE BARRAS
#Ejercicio: Utilizar la función barplot() para construir un histograma 
# para la variable "Occupation".
#Tabla de frecoenclas
windows()
frec=table(data$occupation)
barplot(frec)

windows()
barplot(frec,
        col= heat.colors(6,alpha=0.5))

#Ejercicio: Construir un diagrama de barras que relacione
#las variables "Occupation" y "gender"
frec2= table(data$gender, data$occupation);frec2

windows()
barplot(frec2,
        col = rainbow(2),
        beside=T,
        ylim=c(0,160))
legend("topright",
       title="Género",
       legend = levels(data$gender),
       fill=rainbow(2),
       cex = 1.5,
       border = T,
       text.col = "black",
       horiz = T)
#Ejercicio: Construya un gráfico de barras que relaciones las variables 
# "ethnicity" y "gender"
frec3= table(data$ethnicity , data$gender);frec2

windows()
barplot(frec3,
        col = rainbow(3),
        beside=T,
        ylim=c(0,300))

legend("topright",
       title="Etnia",
       legend = levels(data$ethnicity),
       fill=rainbow(3),
       cex = .9,
       border = T,
       text.col = "black",
       horiz = T)

(frec3 <- table(data$ethnicity,data$gender))

#segunda opcion
windows()
barplot(frec3,
        col=rainbow(3),
        beside=F, 
        ylim = c(0,600))
legend("topright",
       title="Etnia",
       legend = levels(data$ethnicity),
       fill=c("red","green","blue"),
       inset = 0.08)

#DIAGRAMA DE TORTA
#Ejercicio: Utilizar la función pie() para construir un diagrama  
#de torta para la variable "Occupation".

(frec4= table(data$occupation))
pie(frec4)

pie(frec4,
    col = heat.colors(6))

#Ejercicio: Construir un diagrama de torta para la variable "sector"
frec5= table(data$sector)

windows()
pie(frec5,
    labels = c("Manufactura","Costrucción","Otros"),
    edg=200,
    radius = 0.8,
    angle = 45,
    col = c("green","blue","red"),
    border = 5,
    lty=10,
    main = "Distribución para el Sector")




