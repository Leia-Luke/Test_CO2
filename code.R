library(tidyverse)

#データの読み込み
data <- read.csv("owid-co2-data.csv")
#データを取り出す
selected_data<- data |> 
  select(country, year, gdp, population, co2_per_capita) |>
  mutate(gdp_per_capita = gdp / population) |>
  filter(country == "Japan", year %in% c(1850 : 2015))

ggplot()
  