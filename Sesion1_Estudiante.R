# DIRECTORIO DE TRABAJO.
#===============================================================================
getwd()
#setwd("C:/Users/destok/Curso R")


# R CÃMO CALCULADORA
#===============================================================================
# R reconoce los siguientes operadores matemÃ¡ticos: suma(+), resta (-), 
# multiplicaciÃ³n (*), divisiÃ³n (/), exponentes (^), divisiÃ³n entera (%/%)

# Ejercicio: Realizar algunas operaciones matemÃ¡ticas.

3+sqrt(2)
round(0.23-exp(5),2)
trunc(5*1/7)
abs(-25)/6
125%/%6


# OPERADORES L?GICOS EN R
#===============================================================================
# R trabaja con los siguientes operadores lÃ³gicos: menor o mayor (< o >), 
# menor o igual (<=), mayor o igual (>=), excatamente igual (==), 
# no es igual a (!=), no a (!a), a o b (a|b), a y b (a&b). 

# Ejercicio:Revisar cÃ³mo funcionan los operadores lÃ³gicos.

2==3
exp(3)!=abs(3)
4>=1


# CREACIÓN DE VARIABLES
#===============================================================================
# Un objeto puede ser creado con el operador "assignar?" el cual se denota 
# como "<-" o con un "=".
# R es sensible a minÃºsculas y mayÃºsculas.

# Ejercicio: Crear algunas variables, por ejemplo: a <- 2.

a <-2
b <- sqrt(0.25)
c <- runif(1,0,5); c 
name <- "Felipe"; name
x <- TRUE;x


# Si el objeto ya existe y se vuelve a asignar, su valor anterior es 
# borrado despuÃ©s de la asignaciÃ³n (la modificaciÃ³n afecta solo objetos 
# en memoria, no a los datos en el disco). El valor asignado puede 
# ser el resultado de una operacion y/o de una funciÃ³n. 


#Ejercicio: Reasignar variables y hacer operaciones con las variables.

a <- b+c; a
f <- round((2*b+exp(c))/a,3);f 

# La funciÃ³n ls() simplemente lista los objetos en memoria: 
# Solo se muestran los nombres de los mismos.

# Ejercicio: Â¿CuÃ¡les son los objetos que tenemos en la memoria?

ls()

# NOTA: Se puede usar punto y coma para separar comandos diferentes 
# en la misma lÃ­nea.



# Si se quiere listar solo aquellos objetos que contengan un carÃ¡cter en 
# particular, se puede usar la opciÃ³n pattern (que se puede abreviar 
# como pat).
  

# Ejercicio: Buscar todos los objetos con la siguiente opciÃ³n ls(pat = "m")

ls(pat = "a")


# TIPOS DE DATOS EN R
#===============================================================================
# numeric: NÃºmero Decimal "4.5".
# numeric: NÃºmero Entero "4".
# logical: Boleano "TRUE - FALSE".
# characters: Texto o cadena de texto.

# Ejercicio: Â¿QuÃ© tipos de datos tengo?. Utilizar la funciÃ³n class()

class(a)
class(name)
class(x)



