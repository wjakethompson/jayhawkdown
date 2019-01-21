library(tidyverse)
library(hexSticker)
library(magick)
library(png)
library(sp)
library(grid)


l <- 1
hex <- data_frame(
  x = 1.35 * l * c(-sqrt(3) / 2, 0, rep(sqrt(3) / 2, 2), 0, rep(-sqrt(3) / 2, 2)),
  y = 1.35 * l * c(0.5, 1, 0.5, -0.5, -1, -0.5, 0.5)
)

theme_hex <- theme_void() + theme_transparent() +
  theme(axis.ticks.length = unit(0, "mm"))

img <- readPNG("hex-logo/jhwk-head.png")
g <- rasterGrob(img, interpolate=TRUE)

# Create empty hexagon
logo <- ggplot() +
  geom_polygon(data = hex, aes(x, y), color = "#0051BA", fill = "white",
    size = 2) +
  annotate(geom = "text", label = "jayhawkdown", x = 0, y = -0.55,
    family = "Trajan Pro", color = "#0051BA", fontface = "bold", size = 6) +
  annotation_custom(g, xmin = -1.1, xmax = 1.1, ymin = -0.5, ymax = 0.9) +
  coord_equal(xlim = range(hex$x), ylim = range(hex$y)) +
  scale_x_continuous(expand = c(0.04, 0)) +
  scale_y_continuous(expand = c(0.04, 0)) +
  theme_hex

png("man/figures/jayhawkdown.png", width = 181, height = 210, bg = "transparent")
print(logo)
dev.off()

logo_large <- ggplot() +
  geom_polygon(data = hex, aes(x, y), color = "#0051BA", fill = "white",
    size = 10) +
  annotate(geom = "text", label = "jayhawkdown", x = 0, y = -0.55,
    family = "Trajan Pro", color = "#0051BA", fontface = "bold", size = 30) +
  annotation_custom(g, xmin = -1.1, xmax = 1.1, ymin = -0.5, ymax = 0.9) +
  coord_equal(xlim = range(hex$x), ylim = range(hex$y)) +
  scale_x_continuous(expand = c(0.04, 0)) +
  scale_y_continuous(expand = c(0.04, 0)) +
  theme_hex

png("man/figures/jayhawkdown-large.png", width = 905, height = 1050, bg = "transparent")
print(logo_large)
dev.off()
