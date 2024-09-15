
# load libraries
library(httr)
library(readr)
library(rvest)


# download a single pdf ---------------------------------------------------

url = "https://www.isid.ac.in/~deepayan/RT2018/notes/review.pdf"

destfile = "review.pdf"

response = GET(url)

if(status_code(response) == 200){
  writeBin(content(respons,"raw"),destfile)
  cat("PDF downloaded and saved to",destfile,"\n")
}else{
  cat("Failed to download PDF. Status code:", status_code(respons),"\n")
}

# list all the pdfs in an html page and download them ---------------------

url = "https://www.isid.ac.in/~deepayan/RT2018/"

page = read_html(url)

links = page %>% 
  html_nodes("a") %>% 
  html_attr("href")

pdf_links = links[grepl("\\.pdf$",links,ignore.case = T)]

pdf_links_absolute = url_absolute(pdf_links,base = url)

dest_loc = "D:/Documents/Google Drive Windows/Study Material/Regression/"

for(i in 1:length(pdf_links_absolute)){

  destfile = glue::glue(dest_loc,"{ifelse(i>9,'','0')}{i} {substring(pdf_links[i],first = 7,last = nchar(pdf_links[i]))}")
  response = GET(pdf_links_absolute[i])
  
  if(status_code(response) == 200){
    writeBin(content(response,"raw"),destfile)
    cat("PDF downloaded and saved to",destfile,"\n")
  }else{
    cat("Failed to download PDF. Status code:", status_code(response),"\n")
  }
  
}
