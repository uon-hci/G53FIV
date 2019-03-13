# Pie plot
# group: group variable
# count: count variable
#
plotPie = function(dataset, group, count, title, colors) {
    pie = ggplot(dataset, aes_q(x = "", y = as.name(count), fill = as.name(group))) +
    geom_bar(stat = "identity") +
    coord_polar("y", start = 0) +
    geom_text(aes(label = scales::percent(percentage)), color = "#B2B2B2", position = position_stack(vjust = 0.5)) +
    labs(title = "Gender distribution", subtitle = "Pie chart") +
    scale_fill_brewer(palette="Set1") +
    theme_minimal() + 
    theme(
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.border = element_blank(),
        panel.grid= element_blank(),
        axis.ticks = element_blank(),
        plot.title= element_text(size = 14, color = "#333333"))
    plot(pie)
}