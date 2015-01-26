#COurse Project Getting and cleaning data
#1. Merges the training and the test sets to create one data set.

dataTestX<-read.table("./test/X_test.txt")
dataTestY<-read.table("./test/y_test.txt")
dataTestSub<-read.table("./test/subject_test.txt")
#print(head(dataTest,2))
dataTrainX<-read.table("./train/X_train.txt")
dataTrainY<-read.table("./train/y_train.txt")
dataTrainSub<-read.table("./train/subject_train.txt")
#print(head(dataTrain,2))
mergeDataX<-rbind(dataTestX,dataTrainX)
mergeDataY<-rbind(dataTestY,dataTrainY)
mergeDataSub<-rbind(dataTestSub,dataTrainSub)
# 3.Uses descriptive activity names to name the activities in the data set
names(mergeDataY)<-"ylabel"
names(mergeDataSub)<-"sublabel"
featureNames<-read.table("./features.txt")
listofNames <-as.character(featureNames[,2])
make.names(listofNames, unique=TRUE)
names(mergeDataX)<-c(listofNames)
#print(View(featureNames[1:561,2]))
#print(View(mergeDataX))
#merge3Data<-cbind(mergeDataY,mergeDataSub,mergeDataX)
#print(View(merge3Data))
#2. Extracts only the measurements on the mean and 
#standard deviation for each measurement.

#print(grep("mean()",names(mergeDataX),value=TRUE,fixed=TRUE))
meanVal<-mergeDataX[,grep("mean()",names(mergeDataX),value=TRUE,fixed=TRUE)]
stdVal<- mergeDataX[,grep("std()",names(mergeDataX),value=TRUE,fixed=TRUE)]
meanStdData<-cbind(meanVal,stdVal)
#print(names(meanStdData))
merge3Data<-cbind(mergeDataY,mergeDataSub,meanStdData)
#print(View(merge3Data))
#3. Uses descriptive activity names to name the activities in the data set
actData<-read.table("./activity_labels.txt")
merge3Data[,1] <- actData[merge3Data[,1], 2] 
#print(head(merge3Data,2))
#4.Appropriately labels the data set with descriptive variable names
(gsub("-",".",names(merge3Data)))
print(View(merge3Data))
