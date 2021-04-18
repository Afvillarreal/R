library("WDI")

setwd("C:/Users/felipe/Desktop/Curso R")

aa = WDIsearch('gdp')
dim(aa)
typeof(aa)

aa[38,]

# Descarga todos los datos "NY.GDP.PCAP.KD: GDP per capital 

Data = WDI(indicator = "NY.GDP.PCAP.KD")

typeof(Data)
dim(Data)



#Hacer filtro para algunos paises

Data1 = WDI(indicator = "NY.GDP.PCAP.KD", 
            country = c('MX','CA','US'), 
              start = 1960, end = 2017)

typeof(Data)
dim(Data)


Data2 = WDI(indicator = "NY.GDP.PCAP.KD", country = c('CO'))


Data2 = WDI(indicator = "NY.GDP.PCAP.KD", country = 'CO', 
            start = 1970, end = 2015)[30,]

Data2 = WDI(indicator = "NY.GDP.PCAP.KD", country = 'CO', 
            start = 1970, end = 2015)[,3]

saveRDS(Data2,file="Data2.rds")
write.table(Data2, "Data2.txt")


