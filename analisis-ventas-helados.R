########################
# Preparación de Datos #
########################

# Lectura del archivo de datos CSV
datos_ventas <- read.csv("datos/venta-helados.csv")

# Muestra los primeros diez registros
head(datos_ventas, 10)

# Muestra las principales estadísticas descriptivas del Data Frame
summary(datos_ventas)

####################################
# Análisis Preliminar de los Datos #
####################################

# Crea un gráfico de líneas con las ventas a lo largo de los 30 días
ventas <- datos_ventas$ventas
plot(
  ganancias,
  type = "o",
  col = "blue",
  ylim = c(0, 200)
  )

# Agrega una línea con el total de ventas por día
ganancias <- datos_ventas$ganancia
lines(
  ventas,
  type = "o",
  col = "red"
)
