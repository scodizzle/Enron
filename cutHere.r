#### function that cuts at the head from the body

testFOO = function(tx){
  cutHere = min(which(tx == ""))-1
  return(tx[1:cutHere])
}