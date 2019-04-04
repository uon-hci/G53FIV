plotHistogram = function(dataset, discrete, continuous, fill, title, subtitle, sorted = FALSE, percentage = FALSE, ylim = FALSE) {
    histogram = histogram(dataset, discrete, continuous, fill, title, sorted, percentage) +
        labs(x = discrete, y = continuous, title = title, subtitle = subtitle) +
        theme_bw() 
    histogram = if (percentage) histogram else histogram + theme(legend.position="none")
    histogram = if (ylim) histogram + coord_cartesian(ylim = ylim) else histogram
    plot(histogram)
}

histogram = function(dataset, discrete, continuous, fill, title, sorted, percentage) {
    h = if (sorted == TRUE) sortedHistogram(dataset, discrete, continuous, fill) else unsortedHistogram(dataset, discrete, continuous, fill)
    bar = if (percentage) geom_bar(position = "fill", stat = "identity") else geom_bar(stat = "identity")
    histogram = h + bar
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