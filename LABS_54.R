
###################################
#  LABORATORIO DE EJEMPLOS EN R   #
###################################

#CREADO POR JESSICA PAOLA AGUILAR SERVIN
#EJEMPLOS DE VISUALIZACIÓN EN R

####################################
#EJEMPLO DE ETIQUETAS UNO
#LLAMAR PAQUETERIAS
# install.packages("ggplot2")
library(ggplot2)

install.packages("maps")
library(maps)

#TRAZAR MAPA DE USA
df <- data.frame(x = state.center$x, y = state.center$y,
                 state = state.name)

p <- ggplot(df, aes(x = x, y = y)) + 
  geom_polygon(data = map_data("state"),
               color = "white",
               aes(x = long, y = lat,
                   fill = map_data("state")$region,
                   group = group)) +
  guides(fill = FALSE)

#VER P
p

#TITULO DEL MAPA
p + 
  geom_text(aes(x = -115, y = 25,
                label = "Mapa de los Estados Unidos"),
            stat = "unique")

#MODIFICA COLOR DE TITULO
p + 
  geom_text(aes(x = -115, y = 25,
                label = "Mapa de los Estados Unidos"),
            stat = "unique",
            size = 4, color = "red")

#CREAR ETIQUETAS
p + 
  geom_text(aes(label = state))

####################################
#EJEMPLO DE ETIQUETAS DOS
#ETIQUETAS GEOM-LABEL

#ETIQUETAS
p + 
  geom_label(aes(x = -115, y = 25,
                 label = "Mapa de los Estados Unidos"),
             stat = "unique")

#PERSONALIZAR ETIQUETAS
p + 
  geom_label(aes(x = -115, y = 25,
                 label = "Mapa de los Estados Unidos"),
             stat = "unique",
             size = 5, color = "red", fill = "green") 

#ETIQUETAR OBSERVACIONES

p + 
  geom_label(aes(label = state))

####################################
#EJEMPLO DE ETIQUETAS TRES
#ETIQUETAS GGREPEL

install.packages("ggrepel")
library(ggrepel)

#CREAR NOMBRES DE ETIQUETAS
p + 
  geom_text_repel(aes(label = state))

#OTRO ESTILO DE ETIQUETA

p + 
  geom_label_repel(aes(label = state))
