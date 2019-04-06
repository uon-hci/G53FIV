plotPoint = function(dataset, continuous1, continuous2, title, subtitle, ylim = FALSE) {
    point = ggplot(dataset, aes(x = !!sym(continuous1), y = !!sym(continuous2))) +
        geom_point(alpha = 0.05) + 
        geom_smooth(model = "lm", color = "red", alpha = 0.1, span = 0.1) +
        labs(x = continuous1, y = continuous2, title = title, subtitle = subtitle) +
        theme_bw() +
        coord_cartesian(ylim = ylim)
    plot(point)
}