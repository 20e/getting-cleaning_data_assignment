##before running this code, we need to set the work directory to the directory "UCI HAR Dataset"
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")
##get the data
#test
test_set<-read.table("test/X_test.txt")
test_labels<-read.table("test/y_test.txt")
subject_test<-read.table("test/subject_test.txt")
#train
training_set<-read.table("train/X_train.txt")
training_labels<-read.table("train/y_train.txt")
subject_train<-read.table("train/subject_train.txt")
##select the data about mean/standard deviation
meanstd<-as.vector(grep("mean|std",features[,2]))
#test
test_set_ms<-test_set[,meanstd]
#train
training_set_ms<-training_set[,meanstd]
##combine data into one data set
#test
TestData<-cbind(subject_test,test_labels,test_set_ms)
#train
TrainData<-cbind(subject_train,training_labels,training_set_ms)
##rename the colomns
features_ms<-features[meanstd,]
names_ms<-as.vector(features_ms[,2])
#test
colnames(TestData)<-c("subject","label_test",names_ms)
#train
colnames(TrainData)<-c("subject","label_train",names_ms)
##activity: change the labels into names
colnames(activity_labels)<-c("No.","activity")
activity_labels$label<-as.numeric(as.character(activity_labels$No.))
library(dplyr)
#test
TestData_good<-inner_join(TestData,activity_labels,by=c("label_test"="No."))
TestData_good<-TestData_good[,c(1,82,3:81)]
#train
TrainData_good<-inner_join(TrainData,activity_labels,by=c("label_train"="No."))
TrainData_good<-TrainData_good[,c(1,82,3:81)]
##make the names tidy:remove the "()","-" and change “t” to “time” , “f”to “freq”
#test
colnames(TestData_good)<-gsub("-",".",colnames(TestData_good))
colnames(TestData_good)<-gsub("_",".",colnames(TestData_good))
colnames(TestData_good)<-gsub("[()]","",colnames(TestData_good))
colnames(TestData_good)<-sub("^t","time",colnames(TestData_good))
colnames(TestData_good)<-sub("^f","freq",colnames(TestData_good))
#train
colnames(TrainData_good)<-gsub("-",".",colnames(TrainData_good))
colnames(TrainData_good)<-gsub("_",".",colnames(TrainData_good))
colnames(TrainData_good)<-gsub("[()]","",colnames(TrainData_good))
colnames(TrainData_good)<-sub("^t","time",colnames(TrainData_good))
colnames(TrainData_good)<-sub("^f","freq",colnames(TrainData_good))
##combine 2 datasets, group by subjects and activity, calculate the average
TotalData<-rbind(TestData_good,TrainData_good)
TotalData_group<-group_by(TotalData,subject,activity)
TotalData_tidy<-summarize_all(TotalData_group,mean)
write.table(TotalData_tidy,"20e_TotalData_tidy.csv",sep=",")