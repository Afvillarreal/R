
# GRÁFICOS BASE EN R
#===============================================================================

#Vamos a utilizar datos que se encuentran accesibles en el paquete AER. 
#Por tanto, se debe instalar y cargar la librería AER

library(AER)

#Ejercicio: Revisar el listado de datos que tiene el paquete 



#Ejercicio: La base de datos que utilizaremos para crear las gráficas
#es CPS1985. Visualizar la base de datos y revisar la información que tiene



#Los graficos base de R se construyen con las funciones hist, plot, boxplot, etc.


#===============================================================================
#===============================================================================
# Gráficos para variables cuantitativas
#===============================================================================

#HISTOGRAMA
#Ejercicio: Utilizar la función hist() para construir un histograma 
# para la variable wage.



#Función de densidad


#Ejercicio: Aplicar lo aprendido.
# 1. Crear una nueva variable, log(wage), que sea el logaritmo del salario (wage). 
# Construir el histograma de log(wage) y compararlo con el histograma de la variable original wage.
# ¿Qué conclusión puede extraerse?




# 2. Construir un histograma para ver la distribución de la 
# variable experiencia (experience).



#DIAGRAMA DE CAJA (boxplot)
#Ejercicio: Utilizar la función boxplot() para construir un histograma 
# para la variable wage.

#En los gráficos boxplot (o Box and Whiskers, más conocidos como Caja y Bigotes) 
#se representan cinco medidas (mínimo, cuartil 1, mediana, cuartil 3 y máximo), 
#lo que nos puede ayudar a hacernos una idea de la asimetría de la distribución. 
#Los gráficos de Caja y Bigotes también permiten detectar valores atípicos y outliers.


#Cuales son los valores atipicos 



#mejorar el grafico


#Ejercicio:Hacer un diagrama de caja para la variable "wage"
#discriminando por género.


#Incluir el salario medio en el diagrama de caja



#Ejercicio: Construir un diagrama de caja para el salario 
# según ocupación.




#===============================================================================
#===============================================================================
# Gráficos para variables cualitativas
#===============================================================================


#DIAGRAMA DE BARRAS
#Ejercicio: Utilizar la función barplot() para construir un histograma 
# para la variable "Occupation".

#tabla de frecuencia
frec = table (data$occupation)

barplot(frec)

windows()
barplot(frec, col=heat.colors(6,alpha=0.5))


#Ejercicio: Construir un diagrama de barras que relacione
#las variables "Occupation" y "gender"

(frec2 = table(data$gender,data$occupation))

barplot(frec2,col=rainbow(2),
        beside=T,
        ylim=c(0,160))
legend("topright",
       title = "G�nero",
       legend = levels(data$gender),
       fill=rainbow(2),
       cex = .75,
       border=F,
       horiz = T,
       text.col = "black")

#Ejercicio: Construya un gráfico de barras que relaciones las variables 
# "ethnicity" y "gender"

(frec3 = table(data$gender,data$gender))

window()
barplot(frec3,
        col=rainbow(3),
        beside=F,
        ylim=c(0,250))

legend("topright",
       title = "Etnia",
       legend = levels(data$etnithy),
       fill=c("red","green","blue"),
       inset = 0.01)

#DIAGRAMA DE TORTA
#Ejercicio: Utilizar la función pie() para construir un diagrama  
#de torta para la variable "Occupation".

frec5 = table(data$sector)

window()
pies(fre5,
     labels =c("Manufactura","Construcci�n","Otros")
     edges = 200,
     radius = 0.8,
     angle = 45,
     col = c("green","blue","red"),
     border = 5,
     lty=10,
     main = "Distribuci�n para el sector")


#Ejercicio: Construir un diagrama de torta para la variable "sector"






