
# Download the file and put the file in the data folder
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

# Unzip the file into data folder
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# unzipped files are in the folder UCI HAR Dataset. Get the list of the files
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files

# read all the files into table
XTrainFile <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)
XTestFile  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
YTrainFile <- read.table(file.path(path_rf, "train", "y_train.txt"),header = FALSE)
YTestFile  <- read.table(file.path(path_rf, "test" , "y_test.txt" ),header = FALSE)
SubjectTrainFile <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
SubjectTestFile  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
FeaturesFile <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
ActivityLabelsFile <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

# Concatenate the data tables by rows
XTrainTest <- rbind(XTrainFile,XTestFile)
YTrainTest <- rbind(YTrainFile,YTestFile)
SubjectTrainTest <- rbind(SubjectTrainFile,SubjectTestFile)
rm(XTrainFile,XTestFile,YTrainFile,YTestFile,SubjectTrainFile,SubjectTestFile)

# name the coloumns
names(SubjectTrainTest) <- c("Subject")
names(YTrainTest) <- c("ActivityID")
names(XTrainTest) <- FeaturesFile$V2

# Concatenate all the data in common table by coloum binding
AllData <- cbind(cbind(SubjectTrainTest,YTrainTest),XTrainTest)
rm(XTrainTest,YTrainTest,SubjectTrainTest,FeaturesFile,SubectTrainTest)

# Filter the coloumn name with only means and std
onlyMeans <- grep("mean()", colnames(AllData))
onlyStd <- grep("std()", colnames(AllData))
SubColoumns <- c(onlyMeans,onlyStd)

tempDataFrame <- AllData[,c(1,2,SubColoumns)]

# Remove coloumns with meanFreq name
newDataFrame <- tempDataFrame[, !grepl("meanFreq", colnames(tempDataFrame))]
rm(onlyMeans,onlyStd,SubColoumns,tempDataFrame)

#labeling the coloumn name of the Activity Label File
colnames(ActivityLabelsFile) <- c("ActivityId", "Activity")

#Activity ID will be replaced by Activity name
newDataFrame$ActivityID <- factor(newDataFrame$ActivityID, labels = ActivityLabelsFile[,2])
colnames(newDataFrame)[2]<-"Activity" # renaming the coloumn as Activity instead of ID
rm(ActivityLabelsFile)

# Renaming the coloumn with tidy text
names(newDataFrame)<-gsub("^t", "time", names(newDataFrame))
names(newDataFrame)<-gsub("^f", "frequency", names(newDataFrame))
names(newDataFrame)<-gsub("Acc", "Accelerometer", names(newDataFrame))
names(newDataFrame)<-gsub("Gyro", "Gyroscope", names(newDataFrame))
names(newDataFrame)<-gsub("Mag", "Magnitude", names(newDataFrame))
names(newDataFrame)<-gsub("BodyBody", "Body", names(newDataFrame))

library(reshape2)
moltenDataFrame <- melt(newDataFrame, id = c("Subject", "Activity"))
tidyFrame <- dcast(moltenDataFrame, formula = Subject + Activity ~ variable,
                   fun.aggregate = mean)
write.table(tidyFrame, file = "tidydata.txt",row.name=FALSE)
rm(moltenDataFrame)
