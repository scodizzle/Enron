################ create network graph  

load(file = "emailheaders.rda")

# create a small subset of the data for testing code
tablesample = table[1:10000,]

# load the igraph package
library(igraph)

# create the igraph object and plot the network graph
table = data.frame(from = tablesample[,2], to = tablesample[,3])
f = graph.data.frame(table, directed = TRUE)
plot(f, vertex.label = NA, layout = layout.fruchterman.reingold, vertex.size=4,
     vertex.label.dist=.5, vertex.color="red", edge.arrow.size=0.5,
	main = "Enron email network", margin = 0)


############## subset Ken Lay's email data, so we can make a network plot of his email data

load(file = "emailheaders.rda")

# extract header information from Ken Lay's sent and recieved emails
kenFrom = table[grep("(kenneth.lay@enron.com|rosalee.fleming@enron.com|klay@enron.com)", table[,2]),]
kenTo = table[grep("(kenneth.lay@enron.com|rosalee.fleming@enron.com|klay@enron.com)", table[,3]),]
ken = rbind(kenFrom,kenTo)

# substitute Ken Lay's email aliases for "kenneth.lay@enron.com"
ken[,2] = gsub("(rosalee.fleming@enron.com|klay@enron.com)", "kenneth.lay@enron.com", ken[,2])
ken[,3] = gsub("(rosalee.fleming@enron.com|klay@enron.com)", "kenneth.lay@enron.com", ken[,3])

# create network plot
table = data.frame(from = ken[,2], to = ken[,3])
f = graph.data.frame(table, directed = TRUE) 
plot(f, vertex.label = NA, layout = layout.fruchterman.reingold, vertex.size=2,
     vertex.label.dist=.5, vertex.color="red", edge.arrow.size=0.2,
	main = "Kenneth Lay's email network", margin = 0)

# check the subject line for interesting material
length(ken[,4]) #4366
ken[grep("(salary|stock|price|bank)",ignore.case = TRUE, ken[,4]),4]  #return 1108

