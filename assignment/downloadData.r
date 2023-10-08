# Specify the URL of the file you want to download
url <- "http://torkar.se/data-suts.csv"

# Specify the file name and location where you want to save the file on your computer
file_name <- "data.csv"
file_path <- "C:\\Users\\flind\\Desktop\\empirical-course\\r-excersices\\assignment"

# Call the download.file() function, passing in the URL and file name/location as arguments
download.file(url, paste(file_path, file_name, sep = ""), mode = "wb")