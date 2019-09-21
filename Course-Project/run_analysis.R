library(dplyr) #Loads %>%

# Set working directory 
setwd("C:\\Users\\seawolfer\\Desktop")


#######################################
# 1 - Download data
#######################################

filename <- "getdata_projectfiles_UCI HAR Dataset.zip"

# Download zipfile if it does not exists
if (!file.exists(filename)){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", filename, method="curl")
}else{
  print("Zip file already exists.")
}

# Checking if file is unzipped in working directory
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
} else{
  print("Folder already exists.")
}
  

#######################################
# 2 - Read data to dataframes 
#######################################

activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("label_ID", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("num","functions"))

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subjects")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label_ID")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subjects")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label_ID")

#######################################
# 3 - Merge the training and test set   
#######################################

X_merged <- rbind(x_train, x_test)
Y_merged <- rbind(y_train, y_test)
Subject_merged  <- rbind(subject_train, subject_test)
Complete_data <- cbind(Subject_merged, Y_merged, X_merged)

####################################################
# 4 - Extract only the mean and standard deviation
#####################################################

# determine columns of data set to keep based on column name...
columnsToKeep <- grepl("subject|label_ID|mean|std", colnames(Complete_data))

# ... and keep data in these columns only
Complete_data <- Complete_data[, columnsToKeep]

######################################################################################
# 5 - Use descriptive activity names to name the activities in the complete data set
#####################################################################################

# Matches label_ID with activity names in activities dataset 
# and insert into respective rows in the complete dataset
Complete_data$label_ID <- activities[Complete_data$label_ID, "activity"]



##############################################################################
# 6 - Appropriately labels the data set with descriptive variable names
##############################################################################
# remove special characters
names(Complete_data) <- gsub("[\\(\\)-]", "", names(Complete_data))

# correct "BodyBody" typo in some columns
humanActivityCols <- gsub("BodyBody", "Body", humanActivityCols)

# expand abbreviations 
names(Complete_data)[1] = "Subjects"
names(Complete_data)[2] = "Activity"
names(Complete_data)<-gsub("Acc", "Accelerometer", names(Complete_data))
names(Complete_data)<-gsub("Gyro", "Gyroscope", names(Complete_data))
names(Complete_data)<-gsub("BodyBody", "Body", names(Complete_data))
names(Complete_data)<-gsub("Mag", "Magnitude", names(Complete_data))
names(Complete_data)<-gsub("^t", "Time", names(Complete_data))
names(Complete_data)<-gsub("^f", "Frequency", names(Complete_data))
names(Complete_data)<-gsub("tBody", "TimeBody", names(Complete_data))
names(Complete_data)<-gsub("-mean()", "Mean", names(Complete_data), ignore.case = TRUE)
names(Complete_data)<-gsub("-std()", "STD", names(Complete_data), ignore.case = TRUE)
names(Complete_data)<-gsub("-freq()", "Frequency", names(Complete_data), ignore.case = TRUE)
names(Complete_data)<-gsub("angle", "Angle", names(Complete_data))
names(Complete_data)<-gsub("gravity", "Gravity", names(Complete_data))

##############################################################################
# 7 - Create a second, independent tidy set with the average of each
#     variable for each activity and each subject
##############################################################################

# calculates average
tidy_data <- Complete_data %>%
  group_by(Subjects, Activity) %>%
  summarise_all(funs(mean))

# Write to text file
write.table(tidy_data, "tidydataset.txt", row.name=FALSE)
