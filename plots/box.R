plotBox = function(dataset, discrete, continuous, title, subtitle, ylim = FALSE) {
    box = ggplot(dataset, aes(x = reorder(!!sym(discrete), -!!sym(continuous)), y = !!sym(continuous), fill = !!sym(discrete))) + 
        geom_boxplot(alpha = 0.2) + 
        stat_summary(fun.y = mean, geom = "point", shape = 20, size = 3, color = "#666666") +
        labs(x = discrete, y = continuous, title = title, subtitle = subtitle) +
        theme_bw() +
        theme(legend.position="none") 
    box = if (ylim) box + coord_cartesian(ylim = ylim) else box
    return (box)
}