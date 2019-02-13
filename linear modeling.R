

CikCount<- LogfileData %>%
  group_by(cik,ip) %>%
  filter(cik=="1364250")%>%
  tally(n(),sort = FALSE)%>%
  ungroup() %>%
  arrange(ip)


# we are goin to take the first 100 ip address from data logfileData
# and check how many times each Ip acces cik file "1364250"

a<- IpCount[IpCount$ip %in% CikCount$ip,]
a<- a%>% arrange(ip)

both<- cbind(CikCount,a)

# Checking data distribution 
# install.packages("ggvis")
library(ggvis)

regr<- data.frame(cik=CikCount$cik,ip=CikCount$ip,cikFreq= CikCount$n, ipFreq= a$n)


regr %>% ggvis(~cikFreq,~ipFreq,fill= ~ipFreq) %>% layer_points()
regr %>% ggvis(~ipFreq,~cikFreq,fill= ~cikFreq) %>% layer_points()

# Overall correlation ipFreq and cikfreq
cor(regr$ipFreq,regr$cikFreq)

# linear modeling
linearmod<- lm(data = regr, cikFreq~ ipFreq)
linearmod

# ipF= intercept+ (B*ipFreq)
# (ipF= 37.73736+ 0.03624*ipFreq)
summary(linearmod)

# capture the model summary as an object

modsummary<- summary(linearmod)

# model coefficients

modcoeeffs<- modsummary$coefficients
modcoeeffs

# best estimate for ipkfreq
bestestm<- modcoeeffs["ipFreq","Estimate"]
bestestm

# standard error. Closer to zero the better
Std.Error<- modcoeeffs["ipFreq", "Std. Error"]
Std.Error

# t Value 
t.value<- modcoeeffs["ipFreq", "t value"]
t.value


# creating a prediction for the linear model.
set.seed(100) 

# set the data to work with
regr2<- regr[,3:4]
regr2$cikFreq<- as.numeric(regr2$cikFreq)
regr2$ipFreq<- as.numeric(regr2$ipFreq)
#########################################################
#train row indices
TrainingRow<- sample(1:nrow(regr), 0.8*nrow(regr))
#training data
TrainDAta<- regr[TrainingRow,]
TestData<- regr[-TrainingRow,]
# applying the model on training data 
lmModl <- lm(cikFreq ~ ipFreq, data=TrainDAta)
#prediction
CikFreqPred <- predict(lmModl, TestData) 
AIC(lmModl)
# predictios as data frame
predictsData <- data.frame(cbind(actuals=TestData$cikFreq, predicteds=CikFreqPred))
predictsData
cor(predictsData)
