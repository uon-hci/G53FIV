# Q1. How do the quality of wine changes according to different country, province and region?

q1 = function(dataset) {
    # Grouping by country to have the average of points
    data.clean %>% group_by(country) %>% summarise(avg_points = mean(points)) -> countryPoints
    plotWorld(countryPoints, "country", "avg_points", "Worlwide wine quality", "Based on reviews on a scale of 1 - 100")
    g = ggplot(countryPoints, aes(country, avg_points)) +
        geom_bar(stat = "identity") +
        coord_polar()
    # plot(g)
}