##extracting only mean and std information
newdata<-newtable[,columns]

##need to add back first two columns: "Patient" and "Activity"
newdata<-cbind(newtable[1:2],newdata)

##changing activity labels
newdata$V1.1[newdata$V1.1==1]<-"Walking"
newdata$V1.1[newdata$V1.1==2]<-"Walking Upstairs"
newdata$V1.1[newdata$V1.1==3]<-"Walking Downstairs"
newdata$V1.1[newdata$V1.1==4]<-"Sitting"
newdata$V1.1[newdata$V1.1==5]<-"Standing"
newdata$V1.1[newdata$V1.1==6]<-"Laying"

##attaches readable labels to first two columns
names(newdata)[1]<-"Patient"
names(newdata)[2]<-"Activity"

##cleans up variable names
names(newdata)<-sub("-","",names(newdata))
names(newdata)<-sub("BodyBody","Body",names(newdata))
names(newdata)<-tolower(names(newdata))

##creates new tidy dataset
install.packages("reshape2")
library(reshape2)
datamelt<-melt(newdata,id=names(newdata)[1:2],measure.vars=names(newdata)[3:88])
tidydata<-dcast(datamelt,patient + activity ~ variable,mean)

##write the dataset to txt file
write.table(tidydata,"tidydata.txt", row.names=FALSE)




