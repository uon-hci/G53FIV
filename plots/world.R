# Plots a world map
plotWorld = function(dataset, countries, values, title, subtitle) {
    world.all = map_data("world")
    world.filtered = world.all %>% filter(region != "Antarctica")
    dataset.filtered = dataset %>% mutate(country = sub("England", "UK", country)) %>% mutate(country = sub("US", "USA", country))
    world.plot = ggplot() + 
        geom_map(data = world.filtered, map = world.filtered, 
                aes(x = long, y = lat, group = group, map_id = region), 
                fill = "white", colour = "#555555", size = 0.5) +
        geom_map(data = dataset.filtered, map = world.filtered,
                aes_string(fill = values, map_id = countries),
                colour="#555555", size = 0.5) +
        scale_fill_continuous(low = "#ef476f", high = "#19ffc1", guide="colorbar") +
        coord_map("mercator", xlim = c(-180,180), ylim = c(-60, 90)) + 
        scale_y_continuous(breaks = c()) +
        scale_x_continuous(breaks = c()) +
        labs(fill = "Quality", title = title, subtitle = subtitle, x="", y="") +
        theme_classic() 
    plot(world.plot)
}