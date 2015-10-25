# Set working directory
setwd("~/Training/Coursera/Getting and Cleaning Data")

# Read train and test data into R
subject_train <- read.table("./Course Project/train/subject_train.txt",header = FALSE)
X_train <- read.table("./Course Project/train/X_train.txt",header = FALSE)
y_train <- read.table("./Course Project/train/y_train.txt",header = FALSE)

subject_test <- read.table("./Course Project/test/subject_test.txt",header = FALSE)
X_test <- read.table("./Course Project/test/X_test.txt",header = FALSE)
y_test <- read.table("./Course Project/test/y_test.txt",header = FALSE)

features <- read.table("./Course Project/features.txt", header=FALSE)
activities <- read.table("./Course Project/activity_labels.txt", header=FALSE)

# Extract activity name from activity_labels.txt
activities2 <- activities[,2]

# Extract feature name from features.txt, transpose and convert to character vector
feature_name <- features[,2]
feature_name <- t(feature_name)
feature_name <- as.character(feature_name)

# Format feature names
NumFeatures <- length(feature_name)
array <- seq(from=1,to=NumFeatures,by=1)
for (i in array) {
    x <- feature_name[i]
    a <- gsub("\\()","",x)
    b <- gsub("-","",a)
    c <- gsub("mean","Mean",b)
    d <- gsub("std","Std",c)
    e <- gsub(" ","",d)
    f <- gsub(",","",e)
    g <- gsub("\\(","",f)
    h <- gsub("\\)","",g)
    feature_name[i] <- h
}

# Subset features to just those related to mean or std
subFeatures <- grep("Mean",feature_name,value=TRUE)
subFeatures2 <- grep("Std",feature_name,value=TRUE)
subFeaturesCombined <- c(subFeatures, subFeatures2)
subFeaturesSorted <- sort(subFeaturesCombined)

# Assign headers to train and test data
names(y_train) <- c("Activity")
names(subject_train) <- c("Subject")
names(X_train) <- feature_name

names(y_test) <- c("Activity")
names(subject_test) <- c("Subject")
names(X_test) <- feature_name

# Subset train and test data to just those fields related to mean or std
X_train2 <- X_train[,subFeaturesSorted]
X_test2 <- X_test[,subFeaturesSorted]

# Assign activity names to the y_test fields in both the train and test data
y_train$Activity <- y_train$Activity %>% factor(levels=c(1:6),labels=activities2)
y_test$Activity <- y_test$Activity %>% factor(levels=c(1:6),labels=activities2)

# For both train and test data, combine subject, activity and measurements fields into 1 table
train_merged <- cbind(subject_train,y_train,X_train2)
test_merged <- cbind(subject_test,y_test,X_test2)

# Merge train and test tables
train_and_test <- rbind(train_merged, test_merged)

# Group and summarize data by subject and activity
train_and_test2 <- group_by(train_and_test,Subject, Activity)
train_and_test3 <- summarize_each(train_and_test2,funs(mean))

# Write tidy data table to text file
write.table(train_and_test3,file="./Course Project/output/tidydata.txt",row.names=FALSE)
write.table(train_and_test3,file="./Course Project/output/tidydata.csv",row.names=FALSE)