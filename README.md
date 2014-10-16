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
 


## About the Code Book

The CodeBook.md file displays the various variable/column names, as well as the activity label text.