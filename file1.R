library(tidyverse)
library(janitor)

mtcars %>%
  ggplot(aes(cyl, mpg)) +
  geom_point()
  