library(tidyverse)
library(janitor)
library(stringr)



dir()

dir(path = "GDP Data")

"GDP Data/NAD-Andhra_Pradesh-GSVA_cur_2016-17.csv" %>% 
  read_csv() -> ap_df

"NAD-Andhra_Pradesh-GSVA_cur_2016-17.csv" %>% 
  str_split("-") %>% 
  unlist() -> state_name_vector

state_name_vector[2] -> st_name

ap_df %>% 
  slice(-c(7,11, 27:33)) %>% 
  pivot_longer(-c(1,2), names_to = "year", values_to = "gsdp") %>% 
  clean_names() %>% 
  select(-1) %>% 
  mutate(state = st_name) -> state_df




# from "GDP Data" folder, exclude GSDP.csv and only take NAD files
dir(path = "GDP Data",
    pattern = "NAD") -> state_files


#Setp 1 ====

dir(path = "GDP Data",
    pattern = "NAD") -> state_files
#create for loop and iterate over all files names

for (i in state_files) {
  print(paste0("File name: ", i))
}


#Step 2====
dir(path = "GDP Data",
    pattern = "NAD") -> state_files
#Extract State names from file name

for (i in state_files) {
  # print(paste0("File name: ", i))
  
  i %>% 
    str_split("-") %>% 
    unlist() -> state_name_vector
  
  state_name_vector[2] -> st_name
  
  print(paste0("State name: ", st_name))
  
}

#Step 3====
dir(path = "GDP Data",
    pattern = "NAD") -> state_files

#read all csv files
for (i in state_files) {
  # print(paste0("File name: ", i))
  i %>% 
    str_split("-") %>% 
    unlist() -> state_name_vector
  
  state_name_vector[2] -> st_name
  
  # print(paste0("State name: ", st_name))
  
  #read csv file
  paste0("GDP Data/", i) %>% 
    read_csv() -> st_df1
  
  st_df1 %>% 
    slice(-c(7,11, 27:33)) %>% 
    pivot_longer(-c(1,2), names_to = "year", values_to = "gsdp") %>% 
    clean_names() %>% 
    select(-1) %>% 
    mutate(state = st_name) -> state_df
  print(state_df)
}


#Step 4====
#read all csv files
#Create empty tibble
tempdf <- tibble()

for (i in state_files) {
  # print(paste0("File name: ", i))
  i %>% 
    str_split("-") %>% 
    unlist() -> state_name_vector
  
  state_name_vector[2] -> st_name
  
  # print(paste0("State name: ", st_name))
  
  #read csv file
  paste0("GDP Data/", i) %>% 
    read_csv() -> st_df1
  
  st_df1 %>% 
    slice(-c(7,11, 27:33)) %>% 
    pivot_longer(-c(1,2), names_to = "year", values_to = "gsdp") %>% 
    clean_names() %>% 
    select(-1) %>% 
    mutate(state = st_name) -> state_df
  print(state_df)
  
  #row bind each dataframe to tempdf and save in tempdf
  bind_rows(tempdf, state_df) -> tempdf
}

tempdf -> final_statewise_gsdp


#Step 5====
#save final_statewise_gsdp in csv
final_statewise_gsdp %>% 
  write_csv("final_statewise_gsdp.csv")














