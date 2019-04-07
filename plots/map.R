# Plots a world map
plotMap = function(dataset, discrete, continuous, title, subtitle, type = "world") {
    map = map(dataset, discrete, continuous, type) +
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

map = function(dataset, discrete, continuous, type = "world") {
    if (type == "usa") {
      data_map = map_data("state")
    } else {
      data_map = map_data("world") %>% filter(region != "Antarctica")
      dataset = dataset %>% mutate(country = sub("England", "UK", country)) %>% mutate(country = sub("US", "USA", country))
      if (type == "europe") {
        data_map = data_map %>% filter(between(long, -10, 30), between(lat, 30, 60))
      }
    }
    empty_fill_color = "white"
    empty_stroke_color = "#BCBCBC"
    fill_stroke_color = "#666666"
    empty_stroke_width = 0.1 
    fill_stroke_width = 0.2
    map = ggplot() +
        geom_map(data = data_map, map = data_map, aes(x = long, y = lat, group = group, map_id = region), 
                fill = empty_fill_color, colour = empty_stroke_color, size = empty_stroke_width) + 
        geom_map(data = dataset, map = data_map, aes_string(fill = continuous, map_id = discrete),
                colour = fill_stroke_color, size = fill_stroke_width)
    return (map)
}

usa = function(dataset, states, continuous, title, subtitle) {
  states_map <- map_data("state")
  empty_fill_color = "white"
  empty_stroke_color = "#BCBCBC"
  fill_stroke_color = "#666666"
  empty_stroke_width = 0.1 
  fill_stroke_width = 0.2 
  map = ggplot() +
    geom_map(data = states_map, map = states_map, aes(x = long, y = lat, group = group, map_id = region), 
             fill = empty_fill_color, colour = empty_stroke_color, size = empty_stroke_width) +
    geom_map(data = dataset, map = states_map, aes_string(fill = continuous, map_id = states),
             colour = fill_stroke_color, size = fill_stroke_width) +
    theme_classic()
  plot(map)
}
