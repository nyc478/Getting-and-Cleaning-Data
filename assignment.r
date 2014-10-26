#As stated in assignement I assume that data are downloaded 
#and extracted from the zip file in working directory
#Read test and train set for both respone and features and the subjects
# use source("assignment.r") to run the script 
library("reshape2")
print("Start reading data")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
test.subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train.subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
print("End reading data")
print("Combining datasets")
subjects<-rbind(test.subject,train.subject)
X <- rbind(X_test, X_train)
Y <- rbind(y_test, y_train)
#Reads in the names of the features
features<-read.table("./UCI HAR Dataset/features.txt")
#Rename the columns of the variables with the features names
colnames(X)<-features[,2]
colnames(subjects)<-"subjects"
colnames(Y)<-"activity"
#Combine features subjects and response Variable
dataset<-cbind(X,subjects,Y)
#Rename Y column as "Activities"
#Read in activities names
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
#Make Activities column factor
dataset$activity<-as.factor(dataset$activity)
#Rename levels of dataset with descriptive variable names. 
levels(dataset$activity)<-levels(activities[,2])
#Extract features on mean and standard deviation
#Find column names that include mean or std the subjects and the activity
extract_features <- grepl("mean|std|activity|subjects", colnames(dataset))
dataset2<-dataset[,extract_features]

print("Reshaping dataset")
#Reshape the dataframe so that data the features variables are listed 
#sequentially for each subject and each activity_labels
dataset.all <- melt(dataset2, id = c("subjects", "activity"))
#create a dataframe of tidy data with the mean for each feature grouped by the 
#variables subject and activity
dataset.aggregate <- dcast(dataset.all, subjects + activity ~ variable, mean)
#writes the tidy dataset into a file
print("Writing dataset into file")
write.table(dataset.aggregate, "./tidydata.txt", row.names = FALSE, quote = FALSE)
print("Finished")

