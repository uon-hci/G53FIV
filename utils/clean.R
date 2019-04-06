# Cleaning dataset
clean = function(dataset) {
    cleaned = dataset %>% select(-X) %>% distinct()
    return (cleaned)
}

removeNa = function(dataset, column = FALSE) {
    if (column != FALSE) {
        return (dataset %>% filter(!is.na(!!sym(column))))
    } else {
        return (dataset %>% na.omit())
    }
}