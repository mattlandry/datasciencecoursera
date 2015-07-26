setwd("~/datascience/3. Obtaining Data/Project/")

training = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

testing = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testing[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# Read features, rename feature names
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Merge datasets
allData = rbind(training, testing)

# Get only mean and stdev
cols <- grep(".*Mean.*|.*Std.*", features[,2])
# First reduce the features table to what we want
features <- features[cols,]
# Now add the last two columns (subject and activity)
cols <- c(cols, 562, 563)
# And remove the unwanted columns from alldata
alldata <- alldata[,cols]
# Add the column names alldata
colnames(alldata) <- c(features$V2, "Activity", "Subject")
colnames(alldata) <- tolower(colnames(alldata))

currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  alldata$activity <- gsub(currentActivity, currentActivityLabel, allData$activity)
  currentActivity <- currentActivity + 1
}

alldata$activity <- as.factor(alldata$activity)
alldata$subject <- as.factor(alldata$subject)

tidy = aggregate(allData, by=list(activity = alldata$activity, subject=alldata$subject), mean)
# Remove the subject, activity column
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t")