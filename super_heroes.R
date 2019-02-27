# Packages
library("futile.logger")
library("ggplot2")
library("dplyr", warn.conflicts = FALSE)

# Cleaner
source (file="./clean.R")

# Plots
source (file="./plots/pie.R")

# Questions
source (file="./questions/q1.R")

# Loading super-heroes
data.raw = read.csv("data_sets/super_heroes/heroes_information.csv", stringsAsFactors = FALSE)

# Info
flog.info("%d rows loaded", nrow(data.raw))

# Cleaning data
data.clean = clean(data.raw)

# Q1. What is the gender distribution?
q1(data.clean)

# Q2. Is the super heroes universe more hero or villain?
# Q3. What are the most active publishers?
# Q4. Who are the most powerful heroes?
# Q5. Are weight and height related to power?
# Q6. What is the most common super power?
# Q7. Is there a correlation between gender and alignment?
# Q8. What is the racial distribution for each publisher?
# Q9. How diverse are the heroes names?
# Q10. What is the eye color distribution?
