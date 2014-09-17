
##reads the 3 necessary train tables into R.
traindata<-read.table("x_train.txt")
trainlabel<-read.table("y_train.txt")
trainsubjects<-read.table("subject_train.txt")

##reads table and creates vector for labels
features<-read.table("features.txt")
labels<-c(as.character(features$V2))

##attaches labels traindata
names(traindata)<-labels

##binds the 3 train tables into 1.
traindata<-cbind(trainlabel,traindata)
traindata<-cbind(trainsubjects,traindata)

## reads the 3 test tables into R.
testdata<-read.table("x_test.txt")
testlabel<-read.table("y_test.txt")
testsubjects<-read.table("subject_test.txt")

##attaches labels to testdata
names(testdata)<-labels

##binds the 3 test tables into 1.
testdata<-cbind(testlabel,testdata)
testdata<-cbind(testsubjects,testdata)

##binds the test and train tables together
newtable<-rbind(traindata,testdata)

##select Mean and Std Colums
Mean<-c(grep("Mean",labels, value=TRUE))
mean1<-c(grep("mean",labels, value=TRUE))
std<-c(grep("std",labels, value=TRUE))
columns<-append(Mean,mean1)
columns<-append(columns,std)
columns<-sort(columns)

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








