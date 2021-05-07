
# GRÁFICOS CON GGPLOT
#===============================================================================

#Vamos a trabajar con la base de datos de la sesión anterior

library(AER)
data("CPS1985")
Data = CPS1985

#Cargar la libreria ggplot2
#El paquete ggplot es uno de los entornos gráficos del R
#Permite elaborar un gráfico a partir de un proceso de acumulación de capas o layers.
#Tiene un cierto nivel de complejidad pero se obtienen resultados muy profesionales.

library(ggplot2)

#Un gráfico realizado con ggplot2 presenta, al menos, tres elementos:

# 1. Datos (Data) que queremos representar (que deben ser un data frame).

# 2. Características estéticas (aesthetic mappings) que describen cómo queremos
#que los datos se vean en el gráfico. Se introducen con la función aes() y se refieren a:
#posición (en los ejes)
#color exterior (color) y de relleno (fill)
#forma de puntos (shape)
#tipo de línea (linetype)
#tamaño (size)

# 3. Objetos geométricos (geom) representan lo que vemos en un gráficos (puntos, líneas, etc.). 
#Todo gráfico tiene, como mínimo, una geometría. La geometría determina el tipo de gráfico:
#geom_point (para puntos)
#geom_lines (para lineas)
#geom_histogram (para histograma)
#geom_boxplot (para boxplot)
#geom_bar (para barras)
#geom_smooth (líneas suavizadas)
#geom_polygons (para polígonos en un mapa)

#Por tanto, para construir un gráfico con ggplot2 se sigue la siguiente estructura:
#ggplot(datos, aes()) + geom_tipo()

#===============================================================================
#===============================================================================
# Gráficos para variables cualitativas
#===============================================================================

#¿Cuáles son las variables cualitativas de la base?
#ethnicity
#region
#gender 
#occupation
#sector 
#union 
#married 

#=================================
## DIAGRAMA DE BARRAS 
#=================================

#Ejercicio: Construir un diagrama de barras para la variable "gender"
#utilizando la libreria ggplot2

ggplot(Data, aes(x = gender)) + geom_bar()

#Ejercicio: Guargar el gráfico anterior en un objeto y añadir más capas para 
#mejorar la visualización.

g1 = ggplot(Data, aes(x = gender)) + geom_bar()

# etiquetar los ejes
g1 + xlab("G�nero")+
  ylab("Numero de casos")

# A�adir un t�tulo
g1 + xlab("G�nero")+
  ylab("Numero de casos")+
  ggtitle("Distribucion de encuestados por genero")

# Reducir ancho de las barras

g1 = ggplot(Data, aes(x = gender)) + geom_bar(width = 0.3)
g1 + xlab("G�nero")+
  ylab("Numero de casos")+
  ggtitle("Distribucion de encuestados por genero")

# Contorno, Color

g1 = ggplot(Data, aes(x = gender)) + geom_bar(width = 0.3, colour = "blue",fill="red")
g1 + xlab("G�nero")+
  ylab("Numero de casos")+
  ggtitle("Distribucion de encuestados por genero")+
  theme_bw()+
  geom_text(stat="count",aes(label=..count..),vjust=-0.2,size=3)




#Ejercicio: Construir el gráfico de barras para el genero pero con la frecuencia 
#relativa.

table(Data$gender)
prop.table(table(Data$gender))*100
t1 = as.data.frame(prop.table(table(Data$gender))*100)
t1
colnames(t1) = c("Genero", "Porcentaje")

window()
g2 = ggplot(t1, aes(x=Genero,y=Porcentaje)) + geom_bar(stat = "identity",width = 0.5, fill="blue")
g2 + xlab(NULL) + ylab("% de entrevistados")+
  ggtitle("Distribuci�n de los entrevistados por genero")+
  theme_light()

#Este esta bien
windows()
g2 <- ggplot(t1, aes(x=Genero,y= Porcentaje)) + 
  geom_bar(stat = "identity",width = 0.5, fill="blue")
g2 + xlab(NULL) + ylab("% de entrevistados") +
  ggtitle("Distribuci�n de los entrevistados por g�nero")+
  theme_light()



#Ejercicio: Hacer un gráfico de barras que tenga información sobre 
#la variable "gender" y "ethnicity"

g3 = ggplot(Data,aes(ethnicity, fill=gender))+ geom_bar(position = "dodge")

g3 + xlab(NULL) + ylab("Numero de casos") +
  ggtitle("Distribuci�n de los entrevistados por g�nero y etnia")+
  scale_x_discrete(labels=c("Caucasico","Hispano","Otro"))+
  scale_fill_discrete("Genero",labels=c("Hombre","Mujer"))+
  theme_light()+
  geom_text(stat = "count",aes(label=..count..),
            position = "stack",
            vjust = 1,
            size = 3,
            color = "black")

#Grafico de barras aplicadas.

g4 = ggplot(Data,aes(ethnicity, fill=gender))+ geom_bar(position = "stack")

g4 + xlab(NULL) + ylab("Numero de casos") +
  ggtitle("Distribuci�n de los entrevistados por g�nero y etnia")+
  scale_x_discrete(labels=c("Caucasico","Hispano","Otro"))+
  scale_fill_discrete("Genero",labels=c("Hombre","Mujer"))+
  theme_light()

#Grafico de barras aplicadas(porcentajes).
g5 = ggplot(Data,aes(ethnicity, y = (..count..)/sum(..count..),fill=gender))+ geom_bar()

  g5 + xlab(NULL) + ylab("Numero de casos") +
  ggtitle("Distribuci�n de los entrevistados por g�nero y etnia")+
  scale_x_discrete(labels=c("Caucasico","Hispano","Otro"))+
  scale_fill_discrete("Genero",labels=c("Hombre","Mujer"))+
  theme_light()+
  geom_text(stat = "count",
            aes(label = paste(round((..count..)/sum(..count..)*100), "%")),
            position = "stack",
            vjust = 1,
            size = 3,
            color = "black")
  
#grafico
  windows()
  g6 = ggplot(Data,aes(ethnicity, y = (..count..)/sum(..count..),fill=gender))+ geom_bar()
  
  g6 + xlab(NULL) + ylab("Numero de casos") +
    ggtitle("Distribuci�n de los entrevistados por g�nero y etnia")+
    scale_x_discrete(labels=c("Caucasico","Hispano","Otro"))+
    scale_fill_discrete("Genero",labels=c("Hombre","Mujer"))+
    theme_light()+
    geom_text(stat = "count",
              aes(label = paste(round((..count..)/sum(..count..)*100), "%")),
              position = "stack",
              vjust = 0.6,
              hjust = 0.8,
              size = 3,
              color = "black")+
              coord_flip()
  



#Listado de paeltas de colores 
#library(wesanderson)
#wes_palettes



#Ejercicio: Hacer un gráfico de barras que tenga información de 
#la variable "ethnicity" por "region" utilizando la opción facet


  g7 = ggplot(Data,aes(ethnicity, y = (..count..)/sum(..count..)))+ geom_bar(fill="blue")
  
  g7 + xlab(NULL) + ylab(NULL) +
    ggtitle("Distribuci�n de la etnia por region ")+
    scale_x_discrete(labels=c("Caucasico","Hispano","Otro"))+
    theme_light()+
    geom_text(stat = "count",
              aes(label = paste(round((..count..)/sum(..count..)*100), "%")),
              position = "stack",
              vjust = 0.6,
              hjust = 0.8,
              size = 3,
              color = "black")+
              facet_grid(.~region)
  
  #Las facetas o “facets” en ggplot me permiten reproducir el mismo 
  #gráfico en diferentes niveles de un factor.

#=================================
## GRAFICO DE TORTA
#=================================

#Ejercicio: Hacer un diagrama circular para la variable "occupation"
#se trata de una transformación sobre el geom_bar 
#(convertirlo a coordenadas polares).

  windows()
  g8 = ggplot(Data, aes(x=1, y = (..count..)/sum(..count..),fill= occupation )) +geom_bar()
  
  g8 + coord_polar(theta = "y")+
    theme_void()+
    geom_text(stat = "count",
              aes(label = paste(round((..count..)/sum(..count..)*100), "%")),
              position = position_stack(vjust = 0.5),
              size = 4,
              color = "black")
           