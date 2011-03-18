####  first aproach  

###I unziped the files from teh shell into the wirking directory for the project
tar -xzvf enron_mail_030204.tar.gz

##using list files I can then access the individual email
list.files("maildir", full.names=TRUE) ## list of the email folders
list.files("maildir", full.names=TRUE, recursive = TRUE)
em = list.files("maildir", full.names=TRUE, recursive = TRUE)
readLines(em[45])  ### displays the "45" email

dircon = gzfile("enron_mail_030204.tar.gz", "r")
ad
# a small example of the data for testing the code...
txt = readLines(con, 100)

dateIndex = grep("Date:", txt)
Date = gsub("Date: ", "", txt[dateIndex])
From = gsub("From: ", "", txt[dateIndex+1])
To = gsub("To: ", "", txt[dateIndex+2]


#### approach 2

#### after unzipping the files and using list,files
#### this code gives a list of the 10 emails  (lenght = 10)
txt = lapply(em[1:10], readLines)
after unlist it is of lenght 1060
txt = unlist(txt)


#### grep on To &  From field
grep("From:.*?@[a-zA-Z]+\\.[a-zA-Z]{3}",tv)
grep("To:.*?@[a-zA-Z]+\\.[a-zA-Z]{3}",txt)

####trying to sub out a string... faileing....


gsub("   ([0-9]{1,3}\\.){3}[0-9]{1,3}   ", "xxx", txt)
gsub(".*(([0-9]{1,3}\\.){3}[0-9]{1,3}).*", "\\1", txt)

gsub("([0-9]|[a-zA-Z]|_|\\.)*?@([0-9]|[a-zA-Z]|_|\\.)*?\\.[a-z]{3}", "T%T%T%T%T",tv)
gsub(".*(([0-9]|[a-zA-Z]|_|\\.)*@([0-9]|[a-zA-Z]|_|\\.)*?\\.[a-z]{3}).*", "\\1",tv)