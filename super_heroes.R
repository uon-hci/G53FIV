# Loading packages
library("futile.logger")
library("ggplot2")

# Loading super-heroes
super_heroes = read.csv("data_sets/super_heroes/heroes_information.csv")

# Info
flog.info("%d rows loaded", nrow(super_heroes))

# Q1. Is there more men or women?
females = super_heroes[super_heroes$Gender == "Female", ]
males = super_heroes[super_heroes$Gender == "Male", ]
unknowns = super_heroes[super_heroes$Gender == "-", ]
flog.info("%d males", nrow(males))
flog.info("%d males", nrow(females))
genders = data.frame(gender = c("Male", "Female", "Unknown"), sum = c(nrow(males), nrow(females), nrow(unknowns)))
pie = ggplot(genders, aes(x = "", y = sum, fill = gender)) +
    geom_bar(stat = "identity") +
    coord_polar(theta = "y", start = 0) +
    theme_minimal()
plot(pie)