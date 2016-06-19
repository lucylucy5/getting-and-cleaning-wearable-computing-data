# First step: merges the training and the test sets to create one data set named "wc" ("wc" stands for wearable computing)
x_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
x_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
colnames(y) <- 'activity'
colnames(subject) <- 'subject'
wc <- cbind(x, y, subject)
wc <- wc[order(subject), ]

# Second step: extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
index <- grep('mean|std', features$V2)
wc1 <- wc[ ,sort(c(index, 562, 563))]

# Third step: Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
activity <- tolower(activity_labels[ , 2])
wc2 <- wc1
for (i in 1 : nrow(wc2)) {
  wc2$activity[i] <- activity[wc1$activity[i]]
}

# Fourth step: appropriately labels the data set with descriptive variable names
# A function to transform the names of the features in the "features.txt" into variable names. For example, if the feature name is "tBodyAcc-mean()-X", the corresponding variable name is "tBodyAcc.mean.x".
transform.var.name <- function(string) {
  words <- unlist(strsplit(string, '-'))
  word2 <- str_extract(words[2], '[a-zA-Z]+')
  if (is.na(words[3]) == FALSE) {
    var.name <- paste(words[1], word2, tolower(words[3]), sep = '.')
  }
  else {var.name <- paste(words[1], word2, sep = '.')}
  return(var.name)
}
var.names.raw <- as.character(features[sort(index), 2])
var.names <- sapply(var.names.raw, transform.var.name, USE.NAMES = FALSE)
colnames(wc2)[1:79] <- var.names

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(dplyr)
summary <- wc2 %>% group_by(subject, activity) %>% summarise_each(funs(mean), -activity, -subject)
write.table(summary, file = 'summary.txt', row.names = F)
