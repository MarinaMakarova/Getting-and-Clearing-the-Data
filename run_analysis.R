## load "dplyr", "data.table", and "reshape2" packages 
## or skip the step if loaded
library(dplyr)
library(data.table)
library(reshape2)

## set working directory
setwd("~/Desktop/Data science/Getting and clearing the data/Week 4_Project")

## load activity and features labels
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

## load test data files into R
test1 <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#assign appropriate names to the variables in data frames
names(test1) <- features [,2]
names(subject_test) <- "subject"
names (y_test) <- "activity"

## merge all 3 datasets for test data
test2 <- cbind(subject_test, y_test, test1)

##convert activity into real activity names instead of levels (1:6)
test2$activity <- as.factor(test2$activity)
levels(test2$activity) <- activity [,2]

## load training data files into R
train1 <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#assign appropriate names to the variables in data frames
names(train1) <- features [,2]
names(subject_train) <- "subject"
names (y_train) <- "activity"

## merge all 3 datasets for training data
train2 <- cbind(subject_train, y_train, train1)

##convert activity into real activity names instead of levels (1:6)
train2$activity <- as.factor(train2$activity)
levels(train2$activity) <- activity[,2]

## combine test and training datasets in one total dataset
total1 <- rbind(test2, train2)

##find columns containing mean and std values
mean_col <- grep("(.*)+mean\\(", features$V2)
std_col <- grep("(.*)+std()", features$V2)

##since we added 2 columns to the left, add 2 to every variable number
mean_col_adj <- mean_col+2
std_col_adj <- std_col +2

##create unique sequence of colunm numbers for mean and std in total1 dataset
col_num_mean_std <- c(mean_col_adj, std_col_adj)

## take subject and activity variable for final data frame of means and 
##standard deviations

total_mean_std <- total1 [,1:2]

## create a loop to take all the colunms with mean or std and assign 
## appropriate names from total1 data frame

for (i in col_num_mean_std) {
        total_mean_std <- cbind(total_mean_std, total1[, i])
        ncol <- ncol(total_mean_std)
        names(total_mean_std) [ncol] <- names(total1) [i] 
}

## melt the data to define id variables and values for future grouping 
melted <- melt(total_mean_std, id.vars = c("subject", "activity"))

## group by subjects, activities, and features (variable column in melted table)
## it will grouped first by subjects, then by activity type, and lastly by
## feature 

names(melted) [3] <- "measurments"
grouped <- group_by(melted, "subject", "activity", "measurements")

## make the data tidy: split measurements colunt into feature, statistics (mean
## or std), and dimension (XYZ)
melted_split <- colsplit(melted$measurments, "\\-", c("feature", "statistics", 
                                                      "dimension"))
melted_split$statistics <- gsub("\\()", "", melted_split$statistics)

##replace measurments column with splited colunm set

melted <- cbind(melted[,1:2], melted_split, melted[,4])
names(melted)[6] <- "value"

## summarize melted data using mean() function to find an average for every
## feature. Summary is made by grouping subject, activity, feature, statistics, 
## and dimension

avg <- aggregate( value ~ subject+activity+feature+statistics+dimension, melted, 
                  mean )

## export the resulting tables
write.table(melted, "./Mean_Std.txt")
write.table(avg, "./Avg.txt")