# Loading packages
library("ggplot2")

# Loading planets
planets = read.csv("data_sets/NASA/planets.csv")

# General info
planets_number = nrow(planets)
message(sprintf("[INFO] %d planets loaded", planets_number))

# PLANETS MASS/SIZE VISUALIZATION
# Filter
planets.mass_radius = subset(planets[c("pl_letter", "pl_bmassj", "pl_radj")], !(is.na(pl_bmassj) | is.na(pl_radj)))
message(sprintf("[INFO] %d planets with mass and radius info filtered", nrow(planets.mass_radius)))
# Plotting
g = ggplot(planets.mass_radius, aes(pl_radj, pl_bmassj)) +
    geom_point(aes(colour = pl_letter, size = pl_radj)) +
    coord_cartesian(ylim=c(0, 22)) +
    theme_minimal()
plot(g)