library(tidyverse)
library(janitor)

mtcars %>%
  ggplot(aes(cyl, mpg)) +
  geom_point() +
  theme_classic()

mtcars %>%
  ggplot(aes(cyl, mpg)) +
  geom_point() +
  theme_classic()







  