# setting the work directory.
setwd("~/rprojects/Cyber and Information security in R")
# loding data in r. the data is in .txt format.
Mydata<- read.delim(file ="data1.txt" , header = T, sep = "\t")
# cheking the data structure
str(Mydata)

# we can check if the data it is supposed to be 
#checking the first 10 rows 
head(Mydata[1:10,])
# check the last few rows
tail(Mydata)

# view the whole table
View(Mydata)
# view the row 100 to 110 in table format
View(Mydata[100:110,])

# after take a look at the data we note:
# some filds are in the wrong format e.g date is a factor and shoul be date
# there miss values (na) which is not good
# (#NAME?) an error that occures in excel. 
# as per this stage we will correct the format for Ip,Date and time fields. 

# make a copy of the data. this is the data we will be working with. 
LogfileData<- Mydata

# for ip address we want it as character.
LogfileData$ip<-as.character(LogfileData$ip) 

# date should be date format.
LogfileData$date<-as.Date.character(LogfileData$date, "%m/%d/%Y")

# time should be in time formt 
LogfileData$time<- strptime(LogfileData$time,format='%H:%M:%S')
LogfileData$time<-format(LogfileData$time, "%H:%M:%S")

# checking the data structure.
str(LogfileData)

# deal with the #Name Error. 
# the error is a s a result of the "=" sing in the execel file. 
# we know the value shoulld be =-index.htm 
# make sure it is in character
LogfileData$extention<- as.character(LogfileData$extention)
LogfileData$extention[LogfileData$extention=="#NAME?"]<- "=-index.htm"

