# Plots a world map
plotMap = function(dataset, countries, continuous, title, subtitle, type = "world") {
    map = map(dataset, countries, continuous, title, type) +
        scale_fill_continuous(low = "#ef476f", high = "#19ffc1", guide = "colorbar") +
        scale_y_continuous(breaks = c()) +
        scale_x_continuous(breaks = c()) +
        labs(fill = "Quality", title = title, subtitle = subtitle, x="", y="") +
        theme_classic() 
    if (type == "world") {
        map = map + coord_map(xlim=c(-180,180), ylim=c(-60, 90))
    } else {
        map = map + coord_map()
    }
    plot(map)
}

map = function(dataset, countries, continuous, title, type = "world") {
    dataset = dataset %>% mutate(country = sub("England", "UK", country)) %>% mutate(country = sub("US", "USA", country))
    data_map = map_data("world") %>% filter(region != "Antarctica")
    empty_fill_color = "white"
    empty_stroke_color = "#BCBCBC"
    fill_stroke_color = "#666666"
    empty_stroke_width = 0.1 
    fill_stroke_width = 0.2
    if (type == "europe") {
        data_map = data_map %>% filter(between(long, -10, 30), between(lat, 30, 60))
    }
    map = ggplot() +
        geom_map(data = data_map, map = data_map, aes(x = long, y = lat, group = group, map_id = region), 
                fill = empty_fill_color, colour = empty_stroke_color, size = empty_stroke_width) + 
        geom_map(data = dataset, map = data_map, aes_string(fill = continuous, map_id = countries),
                colour = fill_stroke_color, size = fill_stroke_width)
    return (map)
}
