# where is the file?
url <- "https://torkar.github.io/desharnais.csv"
# where should we place the file?
destFile <- "C:\\Users\\flind\\Desktop\\r-folder\\week6\\desharnais.csv"
# d/l file
download.file(url , destFile)
# read the file into d
d <- read.csv ("C:\\Users\\flind\\Desktop\\r-folder\\week6\\desharnais.csv")
# remove columns we don ’t need
d <- d[-c(1)]
str(d) # check format
