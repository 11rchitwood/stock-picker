library(quantmod)
library(tidyverse)
library(tsbox)
stocks<-c("AMD","NVDA","INTC","TSLA","T","VZ","DAL","BA","TWTR","TCEHY","NFLX","AAPL","MFST")
data<-list(AMD,NVDA,INTC,TSLA,T,VZ,DAL,BA,TWTR,TCEHY,NFLX,AAPL,MFST)
getSymbols(stocks)




moving_average<-function(x){
open<-x[,1]
open_length<-length(open)
open_back<-open_length-30 
open_range<-open[open_back:open_length]
average<-mean(open_range)
print(average)
}





lapply(data,moving_average)






"Function to take the moving average of a stock's volume over a given range"


volume_function<-function(x,y){
volume<-x[,5]
transform<-ts_df(volume)
difference<-mutate(transform,diff=value-lag(value))
range<-(length(difference$diff)-y)
range2<-length(difference$diff)
range3<-difference$diff[range:range2]
average<-mean(range3)
print(average)
}




