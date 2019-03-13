# Packages
library("futile.logger")
library("ggplot2")
library("dplyr", warn.conflicts = FALSE)
library("scales")
library("maps")

# Cleaner
source (file="./clean.R")

# Plots
source (file="./plots/pie.R")
source (file="./plots/world.R")

# Questions
source (file="./questions/q1.R")

# Loading data
flog.info('Loading data..')
data.raw = read.csv("data_sets/wines/winemag-150k.csv")

# Info
flog.info("%d rows loaded", nrow(data.raw))

# Cleaning data
data.clean = clean(data.raw)

# Q1. How does the quality of wine change according to the country, province and region of origin?
q1(data.clean)

# Q2. Where can be found the best wines for the best prices?
# Q3. What words are usually used to describe the best wines?
