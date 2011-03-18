
#Create a connection to the compressed data set
con = gzfile("enron_mail_030204.tar.gz", "r")
#close(con)

# Determine the number of rows (records) in the data set
nrec = length(count.fields(con, sep="\n") )  #ans: 27390842

# Prepare the looping structure for reading in segments of the data set
left = nrec
nLines = 10000

# The looping structure for reading in segments of the data set
while(left > 0) 
{

	# read in a segment of the dataset
	interval = readLines(con, n = nLines)

	# identify the rows which start with "From: "
	index = grep("^From: (.*)@[a-zA-Z_]+?\\.[a-zA-Z]{3}", interval)

	# identify the rows which have the Date, To, and Subject by
	# their position relative to the "From" rows
	Date = interval[index - 1]
	From = interval[index]
	To = interval[index + 1]
	Subject = interval[index + 2]

	# output the Date, To, From, and Subject
	cat(Date, sep = "\n", file = "Date.txt", append = TRUE)
	cat(To, sep = "\n", file = "To.txt", append = TRUE)
	cat(From, sep = "\n", file = "From.txt", append = TRUE)
	cat(Subject, sep = "\n", file = "Subject.txt", append = TRUE)
	left = left - nLines
}
#close(con)

# read in the Date, To, From and Subject, creating one table
table = cbind(readLines("Date.txt"), 
			readLines("From.txt"), readLines("To.txt"), readLines("Subject.txt"))

# save the table, so that the process-time-intensive steps don't need repeating
#save(table, file = "emailheaders.rda")

# determine the number of emails in the table, including malformed emails
length(table[,1])  #ans: 447380

# cut out all emails for which the "Date" row doesn't start with "Date"
# This eliminates malformed email headers

table = subset(table, grepl("^Date:", table[,1]) & grepl("^From:", table[,2]) & 
				grepl("^To:", table[,3]) & grepl("^Subject:", table[,4]) )

# determine the number of emails in the table, discluding malformed emails
length(table[,1])   #ans: 303330

# assign column names
names(table) = c("Date", "From", "To", "Subject")

# remove the "From", "To", "Date", "Subject" string from the beginning of each column
table[,1] = gsub("^Date: ", "", table[,1])
table[,2] = gsub("^From: ", "", table[,2])
table[,3] = gsub("^To: ", "", table[,3])
table[,4] = gsub("^Subject: ", "", table[,4])

# create a small subset of the data for testing code
tablesample = table[1:100,]

###################### create network graph  


