
url = "http://home.iitk.ac.in/~shalab/course"

page = read_html(url)

page %>% 
  html_nodes("a") %>% 
  html_attr("href")

url = "http://home.iitk.ac.in/~shalab/course5.htm"

page = read_html(url)

links = page %>% 
  html_nodes("a") %>% 
  html_attr("href")

pdf_links = links[grepl("\\.pdf$",links,ignore.case = T)]

pdf_links_absolute = url_absolute(pdf_links,base = url)

dest_loc = "D:/Documents/Google Drive Windows/Study Material/Regression/Shalabh/"

for(i in 1:length(pdf_links_absolute)){
  
  destfile = glue::glue(dest_loc,"{ifelse(i>9,'','0')}{i} {substring(pdf_links[i],first = stringr::str_locate(pdf_links[i],'-')[2] + 1,last = nchar(pdf_links[i]))}")
  response = GET(pdf_links_absolute[i])
  
  if(status_code(response) == 200){
    writeBin(content(response,"raw"),destfile)
    cat("PDF downloaded and saved to",destfile,"\n")
  }else{
    cat("Failed to download PDF. Status code:", status_code(response),"\n")
  }
  
}
