library(tidyverse)
library(rvest)

# Generate the URL
url <- "https://finance.yahoo.com/quote/AAPL"

# Read in the webpage data
page <- read_html(url)

# Extract just the article titles
article_titles <- page %>%
  html_nodes("#Main") %>%
  html_nodes("h3") %>%
  html_text() %>%
  as_tibble_col(column_name = "title")

# Compute the sentiment for each word
library(tidytext)
word_sentiment <- article_titles %>%
  rowid_to_column() %>%
  unnest_tokens(word, title) %>%
  inner_join(sentiments, by = "word") %>%
  mutate(sentiment = factor(sentiment, levels = c("positive", "negative")))

# Decide whether to buy or sell
buy_or_sell <- function(sentiment) {
  tb <- table(sentiment)
  if (tb[["positive"]] > tb[["negative"]]) {
    "BUY"
  } else {
    "SELL"
  }
}

buy_or_sell(word_sentiment$sentiment)
