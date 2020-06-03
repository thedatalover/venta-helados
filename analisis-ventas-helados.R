########################
# Preparación de Datos #
########################

# Lectura del archivo de datos CSV
datos_ventas <- read.csv("datos/venta-helados.csv")

# Muestra los primeros diez registros
head(datos_ventas, 10)

# Muestra las principales estadísticas descriptivas del Data Frame
summary(datos_ventas)
