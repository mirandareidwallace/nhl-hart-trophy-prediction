setwd("/Users/mirandawallace/Desktop/4th YEAR/STATS 445/S445 RMarkdown")

library(rvest)

hart_url <- "https://www.hockey-reference.com/awards/voting-2019.html"
html_data_hart <- read_html(hart_url)

all_tables_hart <- html_data_hart %>% html_table(fill=TRUE)


hart_table_ranks <- all_tables_hart[[1]]
names(hart_table_ranks) <- as.character(unlist(hart_table_ranks[1,]))
hart_table_ranks <- hart_table_ranks[-1,]

hart_table_ranks <- hart_table_ranks[, -c(3,4,5,6,8:25)]

library("writexl")
write_xlsx(hart_table_ranks,"/Users/mirandawallace/Desktop/4th YEAR/STATS 445/S445 RMarkdown//hart_data_ranks19.xlsx")


library(readxl)
hr.xl <- read_excel("hart_data_ranks19.xlsx")
head(hr.xl)
