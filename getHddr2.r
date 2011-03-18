
#####  code leading to getHddr function
hddr = lapply(txt, function(i){unlist(i)[1:min(which(unlist(i) == ""))-1]})
hddr.com = textConnection(unlist(hddr))
read.dcf(hddr.com, fields = c("To","From"))

bddy = lapply(ME, function(j){unlist(j)[min(which(unlist(j) == "")):length(j)]})


####  first getHddt code
testFOO = function(ME, ...) {
info = c(...)
tmpHD =  lapply(ME, function(i){unlist(i)[1:min(which(unlist(i) == ""))-1]})
ans = lapply(tmpHD, function(i){read.dcf(textConnection(i), fields = info)})
ans  = as.data.frame(do.call('rbind', ans))
return(ans)
}









closeAllConnections()
debug(testFOO)
debug(getDataFromText)
testFOO(txt, info =c("To", "From"))


