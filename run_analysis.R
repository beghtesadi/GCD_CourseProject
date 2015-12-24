library(data.table)
library(plyr)

## Read the test, training data files
df_train <- read.table("./UCI HAR Dataset/train/X_train.txt" , header = FALSE, sep="")
df_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE , sep="")

## Read the features.txt file, and change the names of the columns to something meaningfule
features <- read.table("./UCI HAR Dataset/features.txt" , header = FALSE)
#Change the name of the columns
colnames(df_train) <- features$V2 
colnames(df_test) <- features$V2

#Combine the training and the test data sets
Df <- rbind(df_train , df_test)

## Read the subject file for training and test data set and put them together
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt" , header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE )
subject_df <- rbind(subject_train,subject_test)

## Read the activity labels for both test and trainig data set, and combine them
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt" , header = FALSE)
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt" , header = FALSE)
Df_y <- rbind(train_y,test_y)

## Add a column of descriptive names to the Df_y table
faclab <- as.factor(Df_y$V1)
deslab <- revalue(faclab, c("1"="WALKING", "2"="WALKING_UPSTAIRS" , "3" = "WALKING_DOWNSTAIRS" , "4"= "SITTING",
                            "5"= "STANDING" , "6" = "LAYING"))
data.table(faclab,deslab)
Df_y$Labels <- deslab

##Create a new date table with descriptive activity names for all the activities in the data set on each subject
DescSubjects <- cbind(Df_y ,subject_df )


##The next step is to extract measurements on the mean and std for each measurement; labels correctly with descriptive name. 
##Then we create  a new data set giving just these measurements.
dd <- Df[,grep("mean|std",colnames(Df))] 
descrptive_subjects_xdata <- cbind(deslab , subject_df , dd)

##The next step is to create a tidy data set with average of each variable for each activity and each subject.
tidy <- vector()
firstcols <- TRUE
for(i in 3:ncol(descrptive_subjects_xdata))
{
  s <- split(descrptive_subjects_xdata[,i] , list(descrptive_subjects_xdata$deslab,descrptive_subjects_xdata$V1))
  m <- sapply(s, mean)
  if(firstcols == TRUE)
  {
    names_m <- names(m)
    subject <- gsub("[^[:digit:]]", "", names_m)
    activity <- gsub("[[:digit:]]","",names_m)
    activity <- mapply(strsplit , activity , "." , fixed = TRUE)
    activity <- unlist(activity)
    tidy <- cbind(tidy , subject )
    tidy <- cbind(tidy , activity)
    firstcols <- FALSE
  }
  tidy <- cbind(tidy , m)
} 

tidy <- data.frame(tidy)
names(tidy) <- c("Subject" , "Activity" , colnames(descrptive_subjects_xdata[,3:81]))
row.names(tidy) <- NULL

## Write tidy data
write.table(tidy, file="tidy.txt", quote=FALSE , row.name=FALSE)

