# At this stage we will filtre the dat for analysis and do some visualization. 
# we need the dplr package to
# install the package
# install.packages("dplyr")
# load the apckage in r
require("dplyr")

# Check howmany unique ip addres we have 
length(unique(LogfileData$ip))

# checking how many times each ip address accessed the site

IpCount<- LogfileData %>%
  group_by(ip) %>%
  tally(n(),sort = FALSE)%>%
  ungroup() %>%
  arrange(desc(n))

# analysis
head(IpCount)

#notice that there some ip with thousands of access. 
#since the data collected was for one day this humanly imposble.
#this might be bots. 
####################################
# lets plot the top 20 in ipcount
library(ggplot2)

top10<-(head(IpCount,10))

# graph
ggplot(top10,aes(x=ip,y= n,  fill=ip))+
  geom_histogram(stat = "identity",colour="black", show.legend = T, binwidth = 5 )+
  scale_fill_brewer(palette = "Paired")+
  xlab("IpAdress")+
  ylab("Log Frequency")+
  theme(axis.text.y = element_text(angle = 45,hjust = 1,color = "blue"))+
  ggtitle("Top 10 By Ipadress")+
  theme(plot.title = element_text(face = "bold",size = 15))
  
