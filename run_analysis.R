## Data Clearning Project

## Date for the data Downloaded June 10, 2014

## Importing the training set
train <- read.csv("UCI HAR Dataset/train/X_train.txt", sep = "", header = F)
## Getting the activity labels
yTrain <- read.csv("UCI HAR Dataset/train/y_train.txt", sep = "", header = F)
  
## Importing the test set
test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep = "", header = F)
## Getting the activity labels
yTest <- read.csv("UCI HAR Dataset/test/y_test.txt", sep = "", header = F)

## Which subject had been used for Test ?
subjectTest <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep = " ", header = F)


## Which subjects had been used for Training ?
subjectTrain <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep = " ", header = F)


## Create the list of all the feature names
features <- read.csv("UCI HAR Dataset/features.txt", sep = " ", header = F)
featureNames <- append(as.character(features$V2), c("activity", "subject"))


## Creating the Merged Data Step 1
## Merge measurement values, activity, and subject labels

testActivity <- cbind(test, yTest)
testFinal <- cbind(testActivity, subjectTest)

trainActivity <- cbind(train, yTrain)
trainFinal <- cbind(trainActivity, subjectTrain)

## Merging the train and the test data, resulting 10299 observations of 563 variables
allData <- rbind(testFinal, trainFinal)

## Creating the Merged Data step2
## Add column names to the merged data set
colnames(allData) <- featureNames

## Creating the Merged Data set Step 3 - Adding and Formatting the column names

## Getting the feature names that have something to do with mean and std
## selecting 79 column names
subFeatures <- features[grep("mean()|std()", features$V2),]

## selecting the columns for mean and std, plus the activity and the subject label   
subsetData <- subset(allData, select = c(as.character(subFeatures$V2), "activity", "subject")) 


## Replace the activity labels with decsriptive ones
subsetData$activity <- as.character(subsetData$activity)
subsetData$activity[subsetData$activity == "1"] <- "WALKING"
subsetData$activity[subsetData$activity == "2"] <- "WALKING UP THE STAIRS"
subsetData$activity[subsetData$activity == "3"] <- "WALKING DOWN THE STAIRS"
subsetData$activity[subsetData$activity == "4"] <- "SITTING"
subsetData$activity[subsetData$activity == "5"] <- "STANDING"
subsetData$activity[subsetData$activity == "6"] <- "LAYING"

## Get the rownames of the data frame to rename
subsetData.cNames <- colnames(subsetData)

## Removing special characters
renameCol <- gsub("-","_",subsetData.cNames)
renameCol <- gsub("\\(\\)", "", renameCol)

## Rename column names to the final names
colnames(subsetData) <- renameCol

meltData <- melt(subsetData, id=c("subject", "activity"), measure.vars=renameCol[1:79])
castData <- dcast(meltData, subject + activity ~ variable, mean)

## Dimension of the final data set is 180 rows and 81 columns
write.csv(castData, "tidy.txt")