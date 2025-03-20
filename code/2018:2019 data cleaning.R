setwd("/Users/mirandawallace/Desktop/4th YEAR/STATS 445/S445 RMarkdown")

library(rvest)

HR_url1 <- "https://www.hockey-reference.com/leagues/NHL_2019_skaters.html"
HR_url2 <- "https://www.hockey-reference.com/awards/voting-2019.html"
HR_url3 <- "https://www.hockey-reference.com/leagues/NHL_2019_skaters-misc.html"

html_data_HR1 <- read_html(HR_url1)
html_data_HR2 <- read_html(HR_url2)
html_data_HR3 <- read_html(HR_url3)

all_tables_HR1 <- html_data_HR1 %>% html_table(fill=TRUE)
all_tables_HR2 <- html_data_HR2 %>% html_table(fill=TRUE)
all_tables_HR3 <- html_data_HR3 %>% html_table(fill=TRUE)

skaters_table <- all_tables_HR1[[1]]
names(skaters_table) <- as.character(unlist(skaters_table[1,]))
skaters_table <- skaters_table[-1,]

hart_table <- all_tables_HR2[[1]]
names(hart_table) <- as.character(unlist(hart_table[1,]))
hart_table <- hart_table[-1,]

more_stats <- all_tables_HR3[[1]]
names(more_stats) <- as.character(unlist(more_stats[1,]))
more_stats <- more_stats[-1,]

skaters_table <- skaters_table[, -c(13,14,15,16,17,18,19,20,21,23,24,25,26,27,28)]

hart_table <- hart_table[, -c(1,3,4,5,6,8:25)]

more_stats <- more_stats[, -c(1,3:25, 28:32)]


skaters_table[,c(6:13)] <- sapply(skaters_table[,c(6:13)], as.numeric)
hart_table[,c(2)] <- sapply(hart_table[,c(2)], as.numeric)
more_stats[,c(2,3)] <- sapply(more_stats[,c(2,3)], as.numeric)


#Keeping the stats I've seen reported in articles that discuss who is predicted to win the Hart Memorial Trophy 

library(dplyr)


skaters_table <- distinct(skaters_table, Rk, .keep_all = TRUE)

skaters_table <- skaters_table[-21,]
hart_table <- hart_table[-c(11,17,19,22,24),]






names(skaters_table)[10] <- "plus_minus"
names(hart_table)[2] <- "vote_percent"


HR_data <- full_join(skaters_table, more_stats)
HR_data <- distinct(HR_data, Rk, .keep_all = TRUE)
HR_data2 <- full_join(HR_data, hart_table)


library("writexl")
write_xlsx(HR_data2,"/Users/mirandawallace/Desktop/4th YEAR/STATS 445/S445 RMarkdown//HR_data_2018-19.xlsx")


library(readxl)
hr.xl <- read_excel("HR_data_2018-19.xlsx")
View(hr.xl)

hr.fil <- filter(hr.xl, GP >= 50 & (TOI/GP) >= 15)
write_xlsx(hr.fil,"/Users/mirandawallace/Desktop/4th YEAR/STATS 445/S445 RMarkdown//S445_finalProject_filteredData2018-19.xlsx")

hr.final <- read_excel("S445_finalProject_filteredData2018-19.xlsx")
View(hr.final)


hr.final.scale <- scale(hr.final[6:16])

hr.final[,c(6:16)] <- sapply(hr.final[,c(6:16)], as.numeric)
