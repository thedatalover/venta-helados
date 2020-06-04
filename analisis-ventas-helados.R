########################
# Preparación de Datos #
########################

# Lectura del archivo de datos CSV
datos_ventas <- read.csv("datos/venta-helados.csv")

# Define la columna día como el índice
rownames(datos_ventas) <- datos_ventas$dia

# Muestra los primeros diez registros
head(datos_ventas, 10)

# Muestra las principales estadísticas descriptivas del Data Frame
summary(datos_ventas)

####################################
# Análisis Preliminar de los Datos #
####################################

# Define los vectores de datos para las gráficas
ventas <- datos_ventas$ventas
ganancias <- datos_ventas$ganancia

## Primer Intento ##

# Crea un gráfico de líneas con el número de helados vedidos a lo largo de los 30 días
plot(
  ventas,
  type = "o"
)

# Agrega una segunda línea con las ganacias totales a lo largo de los 30 días
lines(
  ganancias,
  type = "o",
  col = "red"
)

## Segundo Intento ##

# Crea un gráfico de líneas con el número de helados vedidos a lo largo de los 30 días
plot(
  ventas,
  type = "o",
  col = "blue",
  ylim = c(0, 150),
  main = "Helados Vendidos y Ganancias los Últimos 30 Días",
  col.main="Orange",
  font.main= 4,
  xlab = "Día",
  ylab = "Valor"
)

# Agrega una segunda línea con las ganacias totales a lo largo de los 30 días
lines(
  ganancias,
  type = "o",
  col = "red"
)

# Agrega una leyenda al gráfico
legend(
  x = 1,
  y = 150,
  legend = c("Ventas", "Ganancias"),
  col = c("blue", "red"),
  lty = 1:1,
)


## Crea gráfico de barras con número de helados vendidos por día
barplot(
  ventas,
  main = "Helados Vendidos por Día",
  xlab = "Día",
  ylab = "Número de Helados Vendidos",
  names.arg = datos_ventas$dia,
  las = 2
)

#####################
# Modelo Predictivo #
#####################

## Regresión Lineal ##
## http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/

# ventas = b0 + b1 * temp

modelo_rl = lm(ventas ~ temp, data = datos_ventas)
modelo_rl

# Ecuación con coeficientes: ventas = 30.7492 + 0.5597 * temp

# Ventas estimadas si tenemos una temperatura de 4 grados
temperatura = 36
ventas_estimadas = 30.7492 + 0.5597 * temperatura
ventas_estimadas

scatter.smooth(
  x = datos_ventas$temp,
  y = datos_ventas$ventas,
  main = "Estimación de Ventas Respecto a la Temperatura"
)

## Red Neuronal ##
## https://www.r-bloggers.com/fitting-a-neural-network-in-r-neuralnet-package/