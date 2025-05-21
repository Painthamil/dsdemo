library(tidyverse)
library(janitor)

"final_statewise_gsdp.csv" %>% 
  read_csv() %>% 
  rename("sector" = "item") -> statewise_gsdp


statewise_gsdp %>% 
  pull(sector) %>% 
  unique()

#1. For every financial year, which sector has performed well 
statewise_gsdp %>% 
  group_by(year, sector) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T)) -> df

df %>% 
  group_by(year) %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1)

#2. For every financial year, which sector has performed least 

statewise_gsdp %>% 
  group_by(year, sector) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T)) -> df

df %>% 
  group_by(year) %>% 
  arrange((total_gsdp)) %>% 
  slice(1)

#3. For every financial year, which state has performed well
statewise_gsdp %>% 
  group_by(year, state) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T)) -> df

df %>% 
  group_by(year) %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1)


#4. For every financial year, which state has performed least
statewise_gsdp %>% 
  group_by(year, state) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T)) -> df

df %>% 
  group_by(year) %>% 
  arrange((total_gsdp)) %>% 
  slice(1)


#5. Top 5 performing states in Manufacturing
statewise_gsdp %>% 
  filter(sector == "Manufacturing") %>% 
  group_by(state) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T)) -> df

df %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1:5)

#6. Top 5 performing states in Construction

statewise_gsdp %>% 
  filter(sector == "Construction") %>% 
  group_by(state) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T)) -> df

df %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1:5)

#7. For financial year 2016-17, for every state get top performing sector
statewise_gsdp %>% 
  filter(year == "2016-17") %>% #pull(state) %>% unique()
  group_by(state, sector) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T)) -> df

df %>% 
  group_by(state) %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1)

#for 2015-16
statewise_gsdp %>% 
  filter(year == "2015-16") %>% #pull(state) %>% unique()
  group_by(state, sector) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T)) -> df

df %>% 
  group_by(state) %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1)


#8. For financial year 2016-17, for every state get top 5 performing sectors
statewise_gsdp %>% 
  filter(year == "2016-17") %>% #pull(state) %>% unique()
  group_by(state, sector) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T)) -> df

df %>% 
  group_by(state) %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1:5)

#9. How many states are performing well in Manufacturing, (if Manufacturing is in top 3)
statewise_gsdp %>% 
  group_by(state, sector) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T)) -> df

df %>% 
  group_by(state) %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1:3) %>% 
  filter(sector == "Manufacturing") -> no_of_states_in_top3_manufacturing

nrow(no_of_states_in_top3_manufacturing)
  

#10. What is the GROSS GSDP of Karnataka for all financial years

statewise_gsdp %>% 
  filter(state == "Karnataka") %>% 
  group_by(year) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm = T))

