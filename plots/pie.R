# Pie plot
# 
# group: group variable
# count: count variable
#
plotPie = function(dataset, group, count) {
    pie = ggplot(dataset, aes_q(x = "", y = as.name(count), fill = as.name(group))) +
    geom_bar(stat = "identity") +
    coord_polar(theta = "y", start = 0)
    plot(pie)
}