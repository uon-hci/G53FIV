plotHistogram = function(dataset, discrete, continuous, fill, title, subtitle, sorted = FALSE, ylim = FALSE, legend = FALSE) {
    h = histogram(dataset, discrete, continuous, fill, title, subtitle, sorted, ylim, legend)
    plot(h)
}

histogram = function(dataset, discrete, continuous, fill, title, subtitle, sorted = FALSE, ylim = FALSE, legend = FALSE) {
    h = if (sorted == TRUE) sortedHistogram(dataset, discrete, continuous, fill) else unsortedHistogram(dataset, discrete, continuous, fill)
    histogram = h +
        geom_bar(stat = "identity") + 
        labs(x = discrete, y = continuous, title = title, subtitle = subtitle) +
        theme_bw()
    if (legend == FALSE) {
        histogram = histogram + theme(legend.position = "none")
    }
    histogram = if (ylim) histogram + coord_cartesian(ylim = ylim) else histogram
    return (histogram)
}

unsortedHistogram = function(dataset, discrete, continuous, fill) {
    histogram = ggplot(dataset,  aes(x = !!sym(discrete), y = !!sym(continuous), fill = !!sym(fill)))
    return (histogram)
}

sortedHistogram = function(dataset, discrete, continuous, fill) {
    histogram = ggplot(dataset,  aes(x = reorder(!!sym(discrete), -!!sym(continuous)), y = !!sym(continuous), fill = !!sym(fill)))
    return (histogram)
}