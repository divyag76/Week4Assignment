library(dplyr)

destfile <- "C:/Users/divya/Documents/Week4Assignment.zip"
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists(destfile)){
  download.file(fileurl, destfile, method = "curl")
}

if(!file.exists("UCI HAR Dataset")){
  unzip(destfile)
}

activityfile <- "C:/Users/divya/Documents/Week4Assignment/UCI HAR Dataset/activity_labels.txt"
featurefile <- "C:/Users/divya/Documents/Week4Assignment/UCI HAR Dataset/features.txt"

featurestxt <- read.table(featurefile, header = FALSE)
colnames(featurestxt)<- c("featurecode", "featurename")
activitytxt <- read.table(activityfile, header = FALSE)
colnames(activitytxt)<- c("activitycode", "activityname")

train_subjectfile <- "C:/Users/divya/Documents/Week4Assignment/UCI HAR Dataset/train/subject_train.txt"
train_xfile <-  "C:/Users/divya/Documents/Week4Assignment/UCI HAR Dataset/train/X_train.txt"
train_yfile <- "C:/Users/divya/Documents/Week4Assignment/UCI HAR Dataset/train/y_train.txt"

train_subject <- read.table(train_subjectfile, col.names = "subject")
train_X <- read.table(train_xfile, col.names = featurestxt$featurename)
train_y <- read.table(train_yfile, col.names = "activitycode")

test_subjectfile <- "C:/Users/divya/Documents/Week4Assignment/UCI HAR Dataset/test/subject_test.txt"
test_xfile <-  "C:/Users/divya/Documents/Week4Assignment/UCI HAR Dataset/test/X_test.txt"
test_yfile <- "C:/Users/divya/Documents/Week4Assignment/UCI HAR Dataset/test/y_test.txt"

test_subject <- read.table(test_subjectfile, col.names = "subject")
test_X <- read.table(test_xfile, col.names = featurestxt$featurename)
test_y <- read.table(test_yfile, col.names = "activitycode")

datasetx <- rbind(train_X, test_X)
datasety <- rbind(train_y, test_y)
datasetsubject <- rbind(train_subject, test_subject)

mergeddata <- cbind(datasetsubject, datasetx, datasety)

tidydata <- mergeddata %>%
                          select(subject, activitycode, contains("mean"),contains("std"))

tidydata$activitycode <- activitytxt[tidydata$activitycode, 2]


names(tidydata)[2] = "activity"

names(tidydata) <- gsub("Acc", "accelerometer", names(tidydata))
names(tidydata) <- gsub("Gyro", "gyroscope", names(tidydata))
names(tidydata) <- gsub("BodyBody", "body", names(tidydata))
names(tidydata) <- gsub("Mag", "magnitude", names(tidydata))
names(tidydata) <- gsub("^t", "time", names(tidydata))
names(tidydata) <- gsub("^f", "frequency", names(tidydata))
names(tidydata) <- gsub("tBody", "timebody", names(tidydata))
names(tidydata) <- gsub("-mean()", "mean", names(tidydata))
names(tidydata) <- gsub("-std", "std", names(tidydata))
names(tidydata) <- gsub("-freq", "frequency", names(tidydata))


finaltidydata <- tidydata %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(finaltidydata, "C:/Users/divya/Documents/Week4Assignment/UCI HAR Dataset/finaltidydata.text", row.name = FALSE )

str(finaltidydata)
