getHddr = function(ME, ...){
tmpHD =  lapply(ME, function(i){unlist(i)[1:min(which(unlist(i) == ""))-1]})
ans = lapply(tmpHD, getDataFromText, info = c(...))
ans  = as.data.frame(do.call('rbind', ans))
return(ans)
}

getDataFromText = function(tx, info){
  con <- textConnection(tx)
  on.exit(close(con))
  tmp <- read.dcf(con, fields = info)
  return(tmp)
}
