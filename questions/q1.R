# Q1. What is the gender distribution?

q1 = function(dataset) {
    gendersCount = dataset %>% mutate(gender = replace(gender, gender == '-', 'Unknown')) %>% group_by(gender) %>% summarise(count = n())
    plotPie(gendersCount, "gender", "count")
}