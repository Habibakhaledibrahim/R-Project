library (tidyverse)
library(ggpubr)
library(propagate)
library(factoextra)
library(arules)
library(arulesViz)
library(clValid)
library(readxl)
library(dplyr)
library(anchors)
library(xlsx)
library(readr)
library(plotly)



## cleaning data (details table)

 collectedone%>% 

      mutate(  Month = substr(Month ,6 ,7) ,
               
               Date = paste( Month , year , sep = "-" ) )  %>%  ##  substr month in data  

      replace.value(c ("AppendTo") , from = "NULL" , to = as.integer(0) ) %>%   ##replace Null with 0 

      subset( select = -c(CompleteNumber , AreaCode) )  -> df  ##delete areacode and complete number columns 

anyNA(df)   ## to check if any nulls in data

glimpse (df)

colnames(df)

##Data Analysis
df %>% 
  ggplot(aes(x=SectorName ))+
  geom_bar(aes(fill = SectorName))  ##most complains in each sector 

df %>% 
  ggplot(aes(x=SectorName))+
  geom_bar(aes(fill = TownName) , position = "dodge")  ->graph1  ##most complains in each town 


plotly::ggplotly(graph1)   ##live graph


df %>% 
  ggplot(aes(x=ComplainTypeName))+
  geom_bar(aes(fill = ComplainTypeName) , position = "dodge")+
  coord_flip()  ->graph2

plotly::ggplotly(graph2) 




