library(plyr) 
library(data.table)
library(dplyr) 

setwd('C:\\Users\\Ahmmed\\Desktop\\material\\cousera\\course material\\getdata and clean\\wk4\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\')
#read data into r
YTest <- read.table("y_test.txt")
XTest <- read.table("X_test.txt")
SubjectTest <- read.table("subject_test.txt")
YTrain <- read.table("y_train.txt")
XTrain <- read.table("X_train.txt")
SubjectTrain <- read.table("subject_train.txt")
Features <- read.table("features.txt")

##Add Column Names:
colnames(XTrain) <- t(Features[2])
colnames(XTest) <- t(Features[2])

##merge of X and Y Train set align since there is no common ID
XTrain$activities <- YTrain[, 1]
XTrain$participants <- SubjectTrain[, 1]
XTest$activities <- YTest[, 1]
XTest$participants <- SubjectTest[, 1]

#Question-1
#Merges the training and the test sets to create one data set.
Train.Test.all <- rbind(XTrain, XTest)
duplicated(colnames(Train.Test.all))
Train.Test.all <- Train.Test.all[, !duplicated(colnames(Train.Test.all))]
##write.csv(Train.Test.all,'Train.Test.all.csv')

##Question-2
##Extracts only the measurements on the mean and standard deviation for each measurement.

Mean <- grep("mean()", names(Train.Test.all), value = FALSE, fixed = TRUE)
##In addition, we need to include 555:559 as they have means 
##and are associated with the gravity terms
Mean <- append(Mean, 471:477)
InstrumentMeanMatrix <- Train.Test.all[Mean]
# For Standard deviation
STD <- grep("std()", names(Train.Test.all), value = FALSE)
InstrumentSTDMatrix <- Train.Test.all[STD]

#Question-3
#Uses descriptive activity names to name the activities in the data set

Train.Test.all$activities <- as.character(Train.Test.all$activities)
Train.Test.all$activities[Train.Test.all$activities == 1] <- "Walking"
Train.Test.all$activities[Train.Test.all$activities == 2] <- "Walking Upstairs"
Train.Test.all$activities[Train.Test.all$activities == 3] <- "Walking Downstairs"
Train.Test.all$activities[Train.Test.all$activities == 4] <- "Sitting"
Train.Test.all$activities[Train.Test.all$activities == 5] <- "Standing"
Train.Test.all$activities[Train.Test.all$activities == 6] <- "Laying"
Train.Test.all$activities <- as.factor(Train.Test.all$activities)

#Question-4
#Appropriately labels the data set with descriptive variable names.
names(Train.Test.all)

names(Train.Test.all) <- gsub("Acc", "Accelerator", names(Train.Test.all))
names(Train.Test.all) <- gsub("Mag", "Magnitude", names(Train.Test.all))
names(Train.Test.all) <- gsub("Gyro", "Gyroscope", names(Train.Test.all))
names(Train.Test.all) <- gsub("^t", "time", names(Train.Test.all))
names(Train.Test.all) <- gsub("^f", "frequency", names(Train.Test.all))

#Change participants names
Train.Test.all$participants <- as.character(Train.Test.all$participants)
Train.Test.all$participants[Train.Test.all$participants == 1] <- "Participant 1"
Train.Test.all$participants[Train.Test.all$participants == 2] <- "Participant 2"
Train.Test.all$participants[Train.Test.all$participants == 3] <- "Participant 3"
Train.Test.all$participants[Train.Test.all$participants == 4] <- "Participant 4"
Train.Test.all$participants[Train.Test.all$participants == 5] <- "Participant 5"
Train.Test.all$participants[Train.Test.all$participants == 6] <- "Participant 6"
Train.Test.all$participants[Train.Test.all$participants == 7] <- "Participant 7"
Train.Test.all$participants[Train.Test.all$participants == 8] <- "Participant 8"
Train.Test.all$participants[Train.Test.all$participants == 9] <- "Participant 9"
Train.Test.all$participants[Train.Test.all$participants == 10] <- "Participant 10"
Train.Test.all$participants[Train.Test.all$participants == 11] <- "Participant 11"
Train.Test.all$participants[Train.Test.all$participants == 12] <- "Participant 12"
Train.Test.all$participants[Train.Test.all$participants == 13] <- "Participant 13"
Train.Test.all$participants[Train.Test.all$participants == 14] <- "Participant 14"
Train.Test.all$participants[Train.Test.all$participants == 15] <- "Participant 15"
Train.Test.all$participants[Train.Test.all$participants == 16] <- "Participant 16"
Train.Test.all$participants[Train.Test.all$participants == 17] <- "Participant 17"
Train.Test.all$participants[Train.Test.all$participants == 18] <- "Participant 18"
Train.Test.all$participants[Train.Test.all$participants == 19] <- "Participant 19"
Train.Test.all$participants[Train.Test.all$participants == 20] <- "Participant 20"
Train.Test.all$participants[Train.Test.all$participants == 21] <- "Participant 21"
Train.Test.all$participants[Train.Test.all$participants == 22] <- "Participant 22"
Train.Test.all$participants[Train.Test.all$participants == 23] <- "Participant 23"
Train.Test.all$participants[Train.Test.all$participants == 24] <- "Participant 24"
Train.Test.all$participants[Train.Test.all$participants == 25] <- "Participant 25"
Train.Test.all$participants[Train.Test.all$participants == 26] <- "Participant 26"
Train.Test.all$participants[Train.Test.all$participants == 27] <- "Participant 27"
Train.Test.all$participants[Train.Test.all$participants == 28] <- "Participant 28"
Train.Test.all$participants[Train.Test.all$participants == 29] <- "Participant 29"
Train.Test.all$participants[Train.Test.all$participants == 30] <- "Participant 30"
Train.Test.all$participants <- as.factor(Train.Test.all$participants)


#Question-5
#Create a tidy data set
Train.Test.all.daat <- data.table(Train.Test.all)
#This takes the mean of every column broken down by participants and activities
Tidy.Data <- Train.Test.all.daat[, lapply(.SD, mean), by = 'participants,activities']
write.table(Tidy.Data, file = "Tidy.txt", row.names = FALSE)
library(memisc)
codebook(Tidy.Data)
Write(codebook(Tidy.Data),file="Codebook.md")