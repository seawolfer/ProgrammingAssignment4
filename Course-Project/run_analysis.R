#get library for reading text files as data.frame
library(data.table)

#==============================================================================================
# 1. Start processing test data
#==============================================================================================

# 1.  read in labels to be used later to add description to variables and observations

# 1.1 read in activity labels
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")

# add more descriptive names to activity labels columns
names(activity_labels)<-c("Activity.Id","Activity")

# 1.2 read in feature list
feature_list<-read.table("UCI HAR Dataset/features.txt")


#==============================================================================================
# 2. Read In test data
#==============================================================================================

# 2.1 read in file containing id's of subjects per observation
test_subjects<-read.table("UCI HAR Dataset/test/subject_test.txt")

# 2.1.1 rename column name of test_subjects
names(test_subjects)<-"Subject.Id"

# 2.2 read in main features file for test data
test_dataset<-read.table("UCI HAR Dataset/test/X_test.txt")

# 2.2.1 Label test_dataset with descriptive variable from the feature_list names
names(test_dataset)<-feature_list$V2

# 2.3 read in activities for test_data
test_activities<-read.table("UCI HAR Dataset/test/Y_test.txt")

# 2.3.1 rename column name of test_activities
names(test_activities)<-"Activity.Id"

# 2.4 bind test data set per observations
testset<-cbind(test_subjects,test_dataset,test_activities)

# 2.5 Take only columns that include the word mean, std and Subject.Id, Activity.Id
sliced_testset <<- testset[,grepl("Subject.Id|Activity.Id|mean\\(\\)|std\\(\\)",colnames(testset))]

# 2.6 Add descriptive activity names to the activities in the test data set
final_testset<-merge(sliced_testset,activity_labels,all=TRUE)


#================================================================================================
# 3. Read In training data
#================================================================================================

# 3.1 read the file containing id's of subjects per observation
train_subjects<-read.table("UCI HAR Dataset/train/subject_train.txt")

# 3.1.1 rename the column name of train_subjects
names(train_subjects)<-"Subject.Id"

# 3.2 read in main features file for test data
train_dataset<-read.table("UCI HAR Dataset/train/X_train.txt")

# 3.2.1 Label train_dataset with descriptive variable from the feature_list names 
names(train_dataset)<-feature_list$V2

# 3.3 read in activities for train_data
train_activities<-read.table("UCI HAR Dataset/train/Y_train.txt")

# 3.3.1 rename column name of train_activities
names(train_activities)<-"Activity.Id"

# 3.4 bind train data set per observations
trainset<-cbind(train_subjects,train_dataset,train_activities)

# 3.5 Take only columns that include words mean, std and Subject.Id, Activity.Id
sliced_trainset <<- trainset[,grepl("Subject.Id|Activity.Id|mean\\(\\)|std\\(\\)",colnames(trainset))]

# 3.6 Add descriptive activity names to activities in the train data set
final_trainset<-merge(sliced_trainset,activity_labels,all=TRUE)

#=================================================================================================
# 4. Merge test and train dataset
#=================================================================================================

data<-merge(final_testset,final_trainset,all=TRUE)

#=================================================================================================
# Produce tidy dataset with the average of each variable for each activity and each subject
#=================================================================================================

#load library for reshaping data
library(reshape2)

# First melt the data set in order to produce a casted table on multiple columns later on.
# Melt data set on all value conserving as ids (Subject.Id and Activity)

# Take column names which will be aggregated
average_columns<-colnames(data[,3:68])

# Melt data
melted_data<- melt(data,id=c("Subject.Id","Activity"),measure.vars=average_columns)

# Cast melted data set to produce tidy dataset
tidy_dataset <- dcast(melted_data, Subject.Id + Activity ~ variable, mean)

#===================================================================================================
# Write tidy dataset to Data folder
#===================================================================================================
write.table(tidy_dataset, file = "tidydataset.txt", row.names= FALSE)