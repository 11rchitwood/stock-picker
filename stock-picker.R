library(quantmod)
library(tidyverse)
library(tsbox)
stocks<-c("AMD","NVDA","INTC","TSLA","T","VZ","DAL","BA","TWTR","TCEHY","NFLX","AAPL","MFST")
data<-list(AMD,NVDA,INTC,TSLA,T,VZ,DAL,BA,TWTR,TCEHY,NFLX,AAPL,MFST)
getSymbols(stocks)


"This function finds the moving average of the stock's open price."


moving_average<-function(x){
open<-x[,1]
open_length<-length(open)
open_back<-open_length-30 
open_range<-open[open_back:open_length]
average<-mean(open_range)
print(average)
}


"Test example of this function."
"this function will work with the lapply application."
moving_average(AMD)
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




"test for the volume_function for the AMD stock for its moving volume average over the past 30 days."
"This function doe not work with lists or with the lapply function."
volume_function(AMD,30)
 








"Function to calculate the moving average of a specific column from a data frame."
"a is the dataframe, b is the column number, c is the oldest time frame, and d is the shortest time frame"


moving_average_redux<-function(a,b,c,d){
column<-a[,b]
range<-length(column)
long_range<-range-c 
short_range<-range-d
long_range_bracket<-column[long_range:range]
short_range_bracket<-column[short_range:range]
long_range_mean<-mean(long_range_bracket)
short_range_mean<-mean(short_range_bracket)
if(short_range_mean>=long_range_mean){
print("buy")
}else{
print("sell")
}
}









"Test for the moving_average_redux function to find the opening moving average for both the past 30 days and past 5 days."
"THe function willl then compare both results and generate a conditional buy or selll as its result based on the comparison."
"This function does not work with lists and lapply."
moving_average_redux(AMD,2,30,5)

