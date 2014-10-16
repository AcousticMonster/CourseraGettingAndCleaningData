## ---------------------------------------------------------------------------------
## Coursera - Getting and Cleaning Data - Course Assignment
## Author: Danny Korves
## Date: 10-15-2014
## ---------------------------------------------------------------------------------

## This script uses the dplyr package
## install.packages("dplyr") <<-- uncomment if package is not installed
library(dplyr)

## Build the training, testing, and actvity labels datasets
## 1. Build the activity labels lookup dataset
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

## 2. Build the training dataset
training = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training[,562] <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
training[,563] <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

## 3. Build the testing dataset
testing = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing[,562] <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testing[,563] <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

## Combine the training and testing dataframe, then convert to data frame table table
combinedReadings <- tbl_df(rbind_list(training, testing))

##----------------------------------------------------------------------------------

## Build features lookup dataset, and cleanup/remove uneeded characters 
## from column names (for future subsetting)
features <- tbl_df(read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE))

## 1. Remove unwanted characters from column names
features <- features %>% mutate(V2 = gsub('-mean', 'mean', V2), ## remove the "-" from -mean
                                V2 = gsub('-std', 'std', V2), ## remove the "-" from -std
                                V2 = gsub('[-()]', '', V2), ## remove the "()"
                                V2 = gsub('[,]', '', V2) ## remove the ","
                                ) 


## 2. Add the activity and subject entries
features <- rbind(features, c(562, "activity"))
features <- rbind(features, c(563, "subject"))

## 3. Replace head names with V2(column 2) of MeanStdCols
colnames(combinedReadings) <- tolower(features[,2])

##----------------------------------------------------------------------------------

## Subset the combinedReadings dataset (for speed/memory purposes)
## 1. Subset only the Mean/Std columns
combinedReadings <- combinedReadings[,grepl("mean|std|activity|subject", names(combinedReadings))]

##---------------------------------------------------------------------------------

## Loop through combinedReadings dataset and add the activity label
## from the activityLabels dataset

## 1. create counter variable
selectedActivity = 1

## 2. loop through the data and replace "activity" number with label text
for (selectedActivityLabel in activityLabels$V2) {
        combinedReadings$activity <- gsub(selectedActivity, 
                                          selectedActivityLabel, 
                                          combinedReadings$activity
                                          )
        
        selectedActivity <- selectedActivity + 1
}

##---------------------------------------------------------------------------------

## Finish final processing and data output
## 1. Group dataset by activity and subject, then find the means for each variable
tidy <- combinedReadings %>% group_by(activity, subject) %>% summarise_each(funs(mean))

## 2. Output data to a text file name "tidy"
write.table(tidy, "tidy.txt", sep="\t", row.names=F)

##----------------------------
## rm(list=ls(all=TRUE)) <<-- uncomment to clear environment (if you wish)
