ifinPI<-function(true,upper,low)
{
  sum=0
  for (i in 1:length(true))
  {
    if (upper[i]>=true[i] & true[i]>=low[i]){
      sum=sum+1
    }
  }
  return(sum/length(true))
}