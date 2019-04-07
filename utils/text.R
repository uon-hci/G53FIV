get_words_frequencies = function(data, exceptions) {
    data.corpus = Corpus(VectorSource(data))
    data.corpus = tm_map(data.corpus, removePunctuation)
    data.corpus = tm_map(data.corpus, removeNumbers)
    data.corpus = tm_map(data.corpus, content_transformer(tolower))
    data.corpus = tm_map(data.corpus, removeWords, stopwords("english"))
    data.corpus = tm_map(data.corpus, stripWhitespace)
    data.corpus = tm_map(data.corpus, removeWords, exceptions)
    data.corpus.tdm = TermDocumentMatrix(data.corpus)
    data.corpus.matrix = as.matrix(data.corpus.tdm)
    data.corpus.vec = sort(rowSums(data.corpus.matrix), decreasing = TRUE)
    return (data.frame(word = names(data.corpus.vec), freq = data.corpus.vec))
}