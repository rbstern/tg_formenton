library(tidyverse)
library(magrittr)

data = read_csv("./data/siglas.csv")
data %<>%
  gather(key = "key", value = "value", -Tribunais)

arg_1 = data$key %>%
  strsplit(split = "_") %>%
  sapply(function(x) x[1])

arg_2 = data$key %>%
  strsplit(split = "_") %>%
  sapply(function(x) x[2])

data %<>%
  mutate(variavel = arg_1,
         ano = arg_2) %>%
  select(-key)

data %<>% spread(variavel, value)
