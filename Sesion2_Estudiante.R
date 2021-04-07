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


#Crear un vector entero.


#Crear un vector lógico


#Crear un vector tipo carácter.



#Utilizar la función typeof(vector) para saber de que tipo es el vector 
#Comprobar si es de un tipo particular mediante la familia de funciones 
#is.character, is.double, is.integer, is.logical, is.atomic.




#IMPORTANTE:
#Todos los elementos de un vector deben ser del mismo tipo, 
#si intentamos combinar distintos tipos de elementos, 
#estos serán transformados al tipo de datos más flexible. 
#Esto se lo llama «coerción», y es un concepto muy importante. 
#El orden de los tipos de datos desde el menos flexible al más 
#flexible es: logical < integer < double < numeric < character.


#Ejercicio
#Comprobar lo anterior definiendo un vector y revisando su tipo.


#Ejercicio
#Extraer elementos de un vector.



#Especificar condiciones lógicas sobre un vector 



#Crear una secuencias



#Calcular la longitud de un vector




#===============================================================================
#===============================================================================
# FACTORES EN R
#===============================================================================
#Es una estructura que solo puede contener una cantidad predefinida 
#de elementos, y es usado para almacenar variables categóricas. 
#Los factores están caracterizados por dos atributos: class y levels





#===============================================================================
#===============================================================================
# MATRICES Y ARRAYS EN R
#===============================================================================
#Una matriz en R es un conjunto de objetos indizados por filas y columnas. 
#Un array en R es lo mismo, salvo que puede tener más de dos dimensiones.

#La sintaxis general de la orden para crear una matriz es la siguiente:
#matrix(data, nrow, ncol, byrow=F)

#Ejercicio: Construir algunas matrices 



#Ejercicio: Extaer elementos de una matriz 



#Ejercicio: Asignar nombres a las filas y columnas de una matriz.



#Funciones para conocer atributos de las matrices 
#dim()	devuelve las dimensiones de una matriz
#colnames() devuelve el nombre de las columnas de una matriz
#rownames()	devuelve el nombre de las filas de una matriz
#mode()	devuelve el tipo de datos de los elementos de una matriz
#length()	devuelve el número total de elementos de una matriz
#is.matrix() 	devuelve T si el objeto es una matriz, F si no lo es.


#Ejercicio: Determine los atributos de la matriz B.



#Un array es la generalización de una matriz de dos dimensiones al caso multidimensional. 
#Su definición general es de la forma:
#array(datos, dimensiones)


#Ejercicio: Crear un arreglo.




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


