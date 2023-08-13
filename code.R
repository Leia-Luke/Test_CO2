library(tidyverse)

#データの読み込み
data <- read.csv("owid-co2-data.csv")
#データを取り出す
selected_data<- data |> 
  select(country, year, gdp, population, co2_per_capita) |>
  mutate(gdp_per_capita = gdp / population) |>
  filter(country == "Japan", year %in% c(1850 : 2015))
#横軸GDP/capita 縦軸CO2/capitaの折れ線プロット
ggplot(
  data = selected_data, aes(x=gdp_per_capita, y=co2_per_capita))+
  geom_line()+
  geom_point()
  