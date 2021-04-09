rm(list = ls()) # limpiar valiables


# Verificar directorio de trabajo
#===============================================================================
getwd()


# Definir directorio de trabajo
#===============================================================================
setwd("C:/Users/CLUQUE2.D/Documents/Analisis de bases de datos en R/Sesion2")



# ESTRUCTURAS EN R
#===============================================================================
# Vector: secuencia de números o texto
# Factor: categorías
# Matrix: tabla numérica
# Data Frame: tabla alfa-numérica
# List: listados de vectores, matrices, data frames.



#===============================================================================
#===============================================================================
# VECTORES EN R
#===============================================================================
#Los vectores son la estructura de datos básica en R, y
#poseen 3 propiedades:
  
#Tipo → typeof
#Longitud (Cuántos elementos contienen) → length
#Atributos (meta-datos adicionales) → attributes

#Los vectores almacenan elementos que deben ser de un mismo tipo.
#Almacenan información de variables cuantitativas o cualitativas. 
#Los vectores son creados con el comando c (del ingles combine).


#Ejercicio:

#Crear un vector numérico.

v_num = c(1,2,7,4,5,11)
class(v_en)

#Crear un vector entero.

v_en = c(1L,3L,5L)
class(v_en)

#Crear un vector lógico
v_log = c(T,F,T,F,T)
class(v_log)

#Crear un vector tipo carácter.
v_car = c("tito","valentina")
class(v_car)


#Utilizar la función typeof(vector) para saber de que tipo es el vector 
#Comprobar si es de un tipo particular mediante la familia de funciones 
#is.character, is.double, is.integer, is.logical, is.atomic.

is.character(v_num)
is.integer(v_en)



#IMPORTANTE:
#Todos los elementos de un vector deben ser del mismo tipo, 
#si intentamos combinar distintos tipos de elementos, 
#estos serán transformados al tipo de datos más flexible. 
#Esto se lo llama «coerción», y es un concepto muy importante. 
#El orden de los tipos de datos desde el menos flexible al más 
#flexible es: logical < integer < double < numeric < character.


#Ejercicio
#Comprobar lo anterior definiendo un vector y revisando su tipo.

v_prueba = c(1,2,"abc") #vector character
class(v_prueba)

v_prueba1 = c(T,F,3L)  #vector integer
class(v_prueba1)

v_prueba2 = c(1,2,3,4,5)
class(v_prueba2)

v_prueba2 = as.character(v_prueba2)
class(v_prueba2)


#Ejercicio

x1 = c(12,13,14,15,16,11,12,13,14)
n = length(c1);n

#Extraer elementos de un vector.

x1[3]

x1[c(3,5)]

x1[-1]

x1[-c(1,n)]


#Especificar condiciones lógicas sobre un vector 

x1>13
x1[x1>13]

x1 != 12
x1[x1 != 12]

#Crear una secuencias

x2 = seq(1:10)

x3 = seq(1,25, by=3)
x3

x4 = rep(1,5)
x4

x5 = rep(c(1,2),6)
x5

x6 = c(2,3,4,NA,NA,11)
is.na(x6)
x6[!is.na(x6)]


#Calcular la longitud de un vector
length(x5)



#===============================================================================
#===============================================================================
# FACTORES EN R
#===============================================================================
#Es una estructura que solo puede contener una cantidad predefinida 
#de elementos, y es usado para almacenar variables categóricas. 
#Los factores están caracterizados por dos atributos: class y levels


x7 = factor(c("O","O","B","AB","B","A","AB"))
class(x7)
levels (x7)
summary (x7)
levels(x1)

#===============================================================================
#===============================================================================
# MATRICES Y ARRAYS EN R
#===============================================================================
#Una matriz en R es un conjunto de objetos indizados por filas y columnas. 
#Un array en R es lo mismo, salvo que puede tener más de dos dimensiones.

#La sintaxis general del orden para crear una matriz es la siguiente:
#matrix(data, nrow, ncol, byrow=F)

#Ejercicio: Construir algunas matrices 
A = matrix(1:6);A
B = matrix(1:6,nrow=2);B
C = matrix(1:6,nrow=2,byrow=T);C

#Ejercicio: Extaer elementos de una matriz 
C[2,3]
C[,1]
C[1,]

#Ejercicio: Asignar nombres a las filas y columnas de una matriz.

rownames(C) = c("s1","s2")
colnames(C) = c("v1","v2","v3")
C

#Funciones para conocer atributos de las matrices 
#dim()	devuelve las dimensiones de una matriz
#colnames() devuelve el nombre de las columnas de una matriz
#rownames()	devuelve el nombre de las filas de una matriz
#mode()	devuelve el tipo de datos de los elementos de una matriz
#length()	devuelve el número total de elementos de una matriz
#is.matrix() 	devuelve T si el objeto es una matriz, F si no lo es.


#Ejercicio: Determine los atributos de la matriz B.
dim(C)
colnames(C)
rownames(C)
mode(C)
length(C)
is.matrix(C)



#Un array es la generalización de una matriz de dos dimensiones al caso multidimensional. 
#Su definición general es de la forma:
#array(datos, dimensiones)


#Ejercicio: Crear un arreglo.

Edad = c(16,17,18,18,21)
Num_her = c(1,2,3,3,4)
Names = c("E1","E2","E3","E4","E5")
Estrato = c(2,3,4,3,5)
Estrato = as.factor(Estrato)
semestre = factor(c(2,3,4,4,7))

class(Edad)
class(Num_her)
class(Names)
class(Estrato)
class(semestre)

Base = data.frame(Edad,Num_her,Names,Estrato,semestre)
Base
dim(Base)
str(Base)#mirar todaslas variables al mismo tiempo
head(Base)

#===============================================================================
#===============================================================================
# LISTAS EN R
#===============================================================================
#Las listas sirven para concatenar objetos donde cada uno puede tener una estructura distinta.
#Esto no ocurre, por ejemplo, en los arrays, donde todos los elementos deben ser del mismo
#tipo (todos números o todos carácter).

#Ejercicio: Crear una lista.



#Ejercicio: Extraer información de una lista.



#IMPORTANTE:Muchas funciones devuelven como resultado una lista de objetos. 


