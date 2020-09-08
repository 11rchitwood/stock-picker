library(tidyverse)
library(rvest)

stem <- "https://finance.yahoo.com/quote/"
symbol <- "AAPL"

page <- read_html(str_c(stem, symbol))

page %>%
  html_nodes("#Main") %>%
  html_nodes("h3") %>%
  html_text()
