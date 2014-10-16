## Getting and Cleaning Data: Course Project Introduction

This repository contains my files created for use with the Coursera project "Getting and Cleaning Data".

## About the raw data

The data features an extract of cell phone readings of various subject owners movements (sit, stand, walking, laying, etc.).
This dataset extracted from the following text files.

The Movement Description Text
* activity_labels.txt

Traning data files 
* X_train.txt 
* Y_train.txt
* subject_train.txt

Testing data files
* X_test.txt
* Y_test.txt
* subject_test.txt


##About the script and the tidy dataset

The script was created to extract columns pertaining three axis points (X, Y, Z) for both Mean and Standard Deviation.
Eighty eight (88) columns out of five hundred and sixty one (561) where used in this dataset. From the eighty eight columns a grouping was made of each subject and their activities. A rollup mean was calculated for each measurement.A text file  named tidy.txt is then exported for used by the Coursera instructors.
 

The run_analysis.R file process the data in the following steps:

1. Loads library dplyr (must have this package install beforehand).

2. Reads the various text dataset files using read.csv into three datasets (activityLabels, training, and testing).
	* example: read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
	* note: the UCI HAR Dataset folder must be located in your R working directory
	* the data url is here: [Link to Data Zip File] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

3. The training and testing datasets are combined into one called "combinedReadings".

4. Create a column name lookup dataset called "features".

5. Next cleanup the features column names by removing uneeded symbols "-", "()", ",".

6. Add column names to the combinedReadings dataset based on the features dataset text variables.

7. Subset the combinedReadings dataset to only include columns with Mean and Standard Deviation in the column names.

8. Loop through and assign the "activityLabels" text descriptions to the combinedReadings "activity" entries.

9. Use dplyr to summarize each column as means, grouped by "activity" and "subject".

10. Finally, write the data to a text file called tidy.txt for submission for grading assignment.


## About the Code Book

The CodeBook.md file displays the various variable/column names, as well as the activity label text.