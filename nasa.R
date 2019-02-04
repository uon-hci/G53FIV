# Loading packages
library("ggplot2")

# Loading planets
planets = read.csv("data_sets/NASA/planets.csv")

# General info
planets_number = nrow(planets)
message(sprintf("[INFO] %d planets loaded", planets_number))

# Plot
g = ggplot(planets, aes(x = pl_discmethod, y = pl_bmassj)) + 
    geom_bar(stat="identity") + 
    scale_colour_brewer(palette = "Set2") + 
    labs(title="Discovery methods", subtitle="For planet discovery", x = "Methods", y = "Quantity", caption = "Planet discovery methods")
plot(g)