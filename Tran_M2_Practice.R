#Trang Tran, ALY6010, Module 2
cat("\014")  # clears console
rm(list = ls())  # clears global environment
try(dev.off(dev.list()["RStudioGD"]), silent = TRUE) # clears plots
try(p_unload(p_loaded(), character.only = TRUE), silent = TRUE) # clears packages
options(scipen = 100) # disables scientific notion for entire R session

library(pacman)
p_load(tidyverse)
p_load(gmodels)
p_load(skimr)

#descriptive statistics
skim(airquality)
summary(airquality)

df <- airquality

p_load(psych)
describe(df)

#clean and Correlation test
df <- na.omit(df)
df <- df |> mutate(Month = as.character(Month), Day = as.character(Day))

df$Day <- factor(df$Day, levels=c(1:31), ordered=TRUE)
df$Month <- factor(df$Month, levels=5:9, ordered=TRUE)

columns <- c('Ozone', 'Solar.R', 'Wind', 'Temp')
round(cor(df[columns]), 2)

table(df$Month)

#boxplot charts
ggplot(df, aes(x = Month, y = Ozone, color = Month)) +
  geom_boxplot() + ggtitle("Ozone boxplot by Month")

ggplot(df, aes(x = Month, y = Wind, color = Month)) +
  geom_boxplot() + ggtitle("Wind boxplot by Month")

#scatterplot charts
ggplot(df, aes(x = Wind, y = Ozone, color = Month)) +
  geom_point() + geom_smooth(color = "red",
                             method = "lm", se = FALSE) +
  ggtitle("Ozone and Wind correlation")

ggplot(df, aes(x = Temp, y = Ozone, color = Month)) +
  geom_point() + geom_smooth(color = "blue",
                             method = "lm", se = FALSE)+
  ggtitle("Ozone and Temperature correlation")

