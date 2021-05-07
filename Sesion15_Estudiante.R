# GRAFICOS CON GGPLOT
#===============================================================================

#Vamos a trabajar con la base de datos de la sesion anterior

library(AER)
data("CPS1985")
Data <- CPS1985

#Cargar la libreria ggplot2
#El paquete ggplot es uno de los entornos graficos del R
#Permite elaborar un grafico a partir de un proceso de acumulacion de capas o layers.
#Tiene un cierto nivel de complejidad pero se obtienen resultados muy profesionales.

library(ggplot2)

#Un grafico realizado con ggplot2 presenta, al menos, tres elementos:

# 1. Datos (Data) que queremos representar (que deben ser un data frame).

# 2. Caracter铆sticas esteticas (aesthetic mappings) que describen como queremos
#que los datos se vean en el gr脙隆fico. Se introducen con la funcion aes() y se refieren a:
#posicion (en los ejes)
#color exterior (color) y de relleno (fill)
#forma de puntos (shape)
#tipo de linea (linetype)
#tama帽o (size)

# 3. Objetos geometricos (geom) representan lo que vemos en un graficos (puntos, lineas, etc.). 
#Todo grafico tiene, como minimo, una geometria. La geometria determina el tipo de grafico:
#geom_point (para puntos)
#geom_lines (para lineas)
#geom_histogram (para histograma)
#geom_boxplot (para boxplot)
#geom_bar (para barras)
#geom_smooth (lineas suavizadas)
#geom_polygons (para poligonos en un mapa)

#Por tanto, para construir un grafico con ggplot2 se sigue la siguiente estructura:
#ggplot(datos, aes()) + geom_tipo()

#===============================================================================
#===============================================================================
# Graficos para variables cuantitativas
#===============================================================================


#=================================
## HISTOGRAMA
#=================================

#Ejercicio: Construir un histograma para la variable "experience"
#utilizando la libreria ggplot2

windows()
ggplot(Data, aes(x = experience))+ geom_histogram()

g1 = ggplot(Data, aes(x = experience))+ geom_histogram(aes(y=..density..),
                                                       bins = 10,
                                                     color = "white",
                                                     fill = "Cyan4",
                                                     linetype = 2)

g1 + ggtile("Distribucion de los a駉s de experiencia")+
  xlab("A駉s de experiencia")+
  ylab("Densidad")+
  theme_bw()



#Ejercicio: 驴Como se distribuye la experiencia segun el genero?

g1 + ggtile("Distribucion de los a駉s de experiencia")+
  xlab("A駉s de experiencia")+
  ylab("Densidad")+
  theme_bw()
facet_grid(gender)



#Ejercicio: Construir un histograma para la experiencia que resalte 
#los intervalos donde se ubica la mayor parte de los empleados
#y adicionalmente muestre el valor medio y la mediana de la variable, 
#asi como su funcion de densidad.

windows()
g2 = ggplot(Data, aes(x = experience))+ geom_histogram(aes(y=..density.., fill = ..count..),
                                                       bins = 20,
                                                       color = "white")

g2 + geom_vline(aes(xintercept=mean(experience)), color="red")+
     geom_vline(aes(xintercept=median(experience)), color="blue")
     labs(title ="Distribucion de la experiencia",
          x= "Experiencia",
          y = "N. empleados")+ 
       scale_fill_continuous(name="N. empleados")+
       geom_density(color="green")+
       theme_light()

#aes(fill=..count..) con esta opci贸n le estoy diciendo el color de las barras 
# se asigne de acuerdo a la cantidad de empleados



#=================================
## CURVAS DE DENSIDAD
#=================================
#Ejercicio: Construya la funci贸n de densidad para la variable 
#"education"

     g3 = ggplot(Data, aes(education)) + geom_density()
     
     g3 = ggplot(Data, aes(education)) + geom_line(stat="density")
     
     g3 + scale_y_continuous("Densidad")+
       scale_x_continuous("Educaci髇")+
       facet_grid(ethnicity~.)



#Ejercicio: Construya la funci贸n de densidad para la variable 
#"education" por "ethnicity"


windows()
g3 + scale_y_continuous("Densidad")+
  scale_y_continuous("Educacion")+
  facet_grid(ethnicity~.)

#Ejercicio: Construya la funci贸n de densidad para la variable 
#"education" por "ethnicity" y "gender"

windows()
g3 + scale_y_continuous("Densidad")+
  scale_y_continuous("Educacion")+
  facet_grid(ethnicity~.)


#=================================
## POLIGONO DE FRECUENCIAS
#=================================

#Poligono de frecuencias para los a?os de experiencia.

g4 = ggplot(Data, aes(experience))+ geom_freqpoly(bins=20, aes(color=gender))

#Ejercicio: Construya un poligono de frecuencias que permita comparar
#los a帽os de experiencia por genero.




#=================================
## DIAGRAMA DE CAJA 
#=================================

#Diagrama de caja para la variable "age"



#Ejercicio: Construya un diagrama de caja para la variable "age" por "gender"




# theme(legend.position="top")   # cambio posici贸n de leyenda
# guides(fill=FALSE) #Para eliminar la leyenda 
# coord_flip()  #Cambio de posicion


#=================================
## DIAGRAMA DE PUNTOS 
#=================================

#Ejercicio: Construya un diagrama de puntos 
#que relacione la "experience" y el "wage", adem谩s distinga por "gender"



#Ejercicio: Construya un diagrama de puntos 
#que relacione la "experience" y el "age", agregar un Smoother 
#para observar el patr贸n dominante.




