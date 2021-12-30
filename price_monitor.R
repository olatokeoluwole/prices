getwd()
setwd("C:/Users/Oluwole Olatoke/Dropbox/My PC (DESKTOP-O55UFMN)/Documents/current_prices")

library(rvest)
library(tidyverse)
library(dplyr)
library(stringr)

### jumia
#RICE

link = "https://www.jumia.com.ng/catalog/?q=50kg+of+rice"
jumia_rice = read_html(link)

Decription = jumia_rice %>% html_nodes(".name") %>% html_text()
price = jumia_rice %>% html_nodes(".prc") %>% html_text()
stock = jumia_rice %>% html_nodes(".ft") %>% html_text()
price=sub("???","",price)
jumia_50kgrice_data = data.frame(Decription, price,stock, stringsAsFactors = FALSE)
jumia_50kgrice_data <- filter(jumia_50kgrice_data,stock=="Add To Cart")
jumia_50kgrice_data["url"]="https://www.jumia.com.ng/catalog/?q=50kg+of+rice"
jumia_50kgrice_data["size"]="50kg"
jumia_50kgrice_data["Product"]="Rice"
jumia_50kgrice_data <- separate(jumia_50kgrice_data, col=price,into= c('out', 'Price'), sep= ' ')
jumia_50kgrice_data <- select(jumia_50kgrice_data, "Product", 'Decription', 'Price', 'size', 'url')


write.csv(jumia_50kgrice_data, "jumia_50kgrice_data.csv")

###247foods
#Rice

link = "https://247foods.ng/shop?srch_term=rice+50kg"
konga_rice = read_html(link)

Description = konga_rice %>% html_nodes("#content h4") %>% html_text()
price = konga_rice %>% html_nodes(".price-new") %>% html_text()
sub("???","",price)
konga_50kgrice_data = data.frame(product, price, stringsAsFactors = FALSE)
konga_50kgrice_data["url"]="https://247foods.ng/shop?srch_term=rice+50kg"
konga_50kgrice_data["size"]="50kg"
konga_50kgrice_data["Product"]="Rice"



konga_50kgrice_data

write.csv(konga_50kgrice_data, "konga_50kgrice_data.csv")

rice_prices= rbind(jumia_50kgrice_data,konga_50kgrice_data)




### jumia
#Garri

link = "https://www.jumia.com.ng/catalog/?q=garri"
jumia_garri = read_html(link)

Description = jumia_garri %>% html_nodes(".name") %>% html_text()
price = jumia_garri %>% html_nodes(".prc") %>% html_text()
stock = jumia_garri %>% html_nodes(".ft") %>% html_text()
price=sub("???","",price)
jumia_garri_data = data.frame(Description, price,stock, stringsAsFactors = FALSE)
jumia_garri_data["url"]="https://www.jumia.com.ng/catalog/?q=garri"
jumia_garri_data["Product"]="Garri"

jumia_garri_1kg_data <- filter(jumia_garri_data,stock=="Add To Cart") %>% 
  filter(str_detect( Description,'1kg'))
jumia_garri_1kg_data["size"]="1kg"
jumia_garri_1kg_data <- separate(jumia_garri_1kg_data, col=price,into= c('out', 'Price'), sep= ' ')
jumia_garri_1kg_data <- select(jumia_garri_1kg_data, 'Product','Description', 'Price', 'size', 'url')


jumia_garri_2kg_data <- filter(jumia_garri_data,stock=="Add To Cart") %>% 
  filter(str_detect( Description,'2kg'))
jumia_garri_2kg_data["size"]="2kg"
jumia_garri_2kg_data <- separate(jumia_garri_2kg_data, col=price,into= c('out', 'Price'), sep= ' ')
jumia_garri_2kg_data <- select(jumia_garri_2kg_data, 'Product','Description', 'Price', 'size', 'url')


write.csv(jumia_garri_2kg_data, "jumia_garri_2kg_data.csv")
write.csv(jumia_garri_1kg_data, "jumia_garri_1kg_data.csv")



###jumia
# TeleVisions
link = "https://www.jumia.com.ng/televisions/"
jumia_tv = read_html(link)

Description = jumia_tv %>% html_nodes(".name") %>% html_text()
price = jumia_tv %>% html_nodes(".prc") %>% html_text()
price=sub("???","",price)

jumia_tv_data = data.frame(Description, price, stringsAsFactors = FALSE)
jumia_tv_data["url"]="https://www.jumia.com.ng/televisions/"
jumia_tv_data["Product"]="Television"
jumia_tv_data <- separate(jumia_tv_data, col=price,into= c('out', 'Price'), sep= ' ')
jumia_32tv_data <- select(jumia_tv_data, 'Product','Description', 'Price', 'url') %>% 
  filter(str_detect( Description,'32'))
jumia_32tv_data["Size"]="32inch"


jumia_43tv_data <- select(jumia_tv_data, 'Product','Description', 'Price', 'url') %>% 
  filter(str_detect( Description,'43'))
jumia_43tv_data["Size"]="43inch"


write.csv(jumia_32tv_data, "jumia_32tv_data.csv")
write.csv(jumia_43tv_data, "jumia_43tv_data.csv")

###kara
#TeleVision
link = "https://kara.com.ng/tv"
kara_tv = read_html(link)

Description = kara_tv %>% html_nodes(".product-item-name") %>% html_text()
Description=as.data.frame(Description)
Description=Description[-21,]
Price = kara_tv %>% html_nodes(".price-box") %>% html_text()
Price=sub("NGN","",Price)
Price=as.data.frame(Price)
kara_43tv_data =data.frame(Description, Price, stringsAsFactors = FALSE) %>% 
  filter(str_detect( Description,'43'))
kara_43tv_data["url"]="https://kara.com.ng/tv"
kara_43tv_data["Product"]="Television"
kara_43tv_data["Size"]="43inch"
kara_43tv_data <- select(kara_43tv_data, 'Product','Description', 'Price','Size', 'url')

link = "https://kara.com.ng/tv"
kara_tv = read_html(link)

Description = kara_tv %>% html_nodes(".product-item-name") %>% html_text()
Description=as.data.frame(Description)
Description=Description[-21,]
Price = kara_tv %>% html_nodes(".price-box") %>% html_text()
Price=sub("NGN","",Price)
Price=as.data.frame(Price)
kara_42tv_data =data.frame(Description, Price, stringsAsFactors = FALSE) %>% 
  filter(str_detect( Description,'42'))
kara_42tv_data["url"]="https://kara.com.ng/tv"
kara_42tv_data["Product"]="Television"
kara_42tv_data["Size"]="42inch"
kara_42tv_data <- select(kara_42tv_data, 'Product','Description', 'Price','Size', 'url')



write.csv(kara_42tv_data, "kara_42tv_data.csv")
write.csv(kara_43tv_data, "kara_43tv_data.csv")




### Kara
#Generators
link = "https://kara.com.ng/generators"
kara_gen = read_html(link)

Description = kara_gen %>% html_nodes(".product-item-name") %>% html_text()
Description=as.data.frame(Description)
Description=Description[-21,]
Price = kara_gen %>% html_nodes(".price-box") %>% html_text()
Price=sub("NGN","",Price)
Price=as.data.frame(Price)
kara_gen_data =data.frame(Description, Price, stringsAsFactors = FALSE)
kara_gen_data["url"]="https://kara.com.ng/tv"
kara_gen_data["Product"]="Generator"


kara_gen_2.5_data <- select(kara_gen_data, 'Product','Description', 'Price', 'url') %>% 
  filter(str_detect( Description,'2.5KVA '))
kara_gen_2.5_data["Size"]="2.5KVA"

kara_gen_10_data <- select(kara_gen_data, 'Product','Description', 'Price', 'url') %>% 
  filter(str_detect(Description,'10KVA'))
kara_gen_10_data["Size"]="10KVA"

kara_gen_7.5_data <- select(kara_gen_data, 'Product','Description', 'Price', 'url') %>% 
  filter(str_detect( Description,'7.5KVA '))
kara_gen_7.5_data["Size"]="7.5KVA"

allkara_gen_data <- rbind(kara_gen_2.5_data,kara_gen_10_data) %>% 
  rbind(kara_gen_7.5_data)

write.csv(allkara_gen_data, "allkara_gen_data.csv")

