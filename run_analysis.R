library(plyr)

# 1. Merges the training and the test sets to create one data set.

pt1 <- read.table("test/X_test.txt")
pt2 <- read.table("test/subject_test.txt")
pt3 <- read.table("test/y_test.txt")
testData <- cbind(pt1,pt2,pt3)

pt1 <- read.table("train/X_train.txt")
pt2 <- read.table("train/subject_train.txt")
pt3 <- read.table("train/y_train.txt")
trainingData <- cbind(pt1,pt2,pt3)

collectiveData <- rbind(trainingData,testData)

# arrange for correct columns
pt2start <- ncol(pt1)+1
pt3start <- pt2start+1

# free up memory variables
rm(pt1,pt2,pt3,trainingData,testData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 
features <- read.table("features.txt")
selectedFeatures <- grep("*-mean\\(\\)|-std\\(\\)*", features[,2]) # filter out the means and stds
collectiveData <- collectiveData[, c(selectedFeatures,pt2start,pt3start)] # also filter out the subject and activity_id

# 3. Uses descriptive activity names to name the activities in the data set.

# construct descriptive names
nameString <- gsub(pattern="-mean\\(\\)",replacement=" mean",as.character(features[selectedFeatures,2]))
nameString <- gsub(pattern="-std\\(\\)",replacement=" std",nameString)
names(collectiveData) <- c(nameString,"Subject","Activity_id") 


# load activity labels and perform index join on activity id 
activity_labels <- read.table("activity_labels.txt",col.names = c("Activity_id","Activity"))
collectiveData <- merge(collectiveData, activity_labels, by = "Activity_id", match = "first")

# 4. Appropriately labels the data set with descriptive variable names. 
# post-process variables for clarity
nameString <- names(collectiveData)
nameString <- gsub('.mean',"Mean",nameString)
nameString <- gsub('.std',"StandardDeviation",nameString)
nameString <- gsub('^t',"TimeDomain",nameString)
nameString <- gsub('^f',"FrequencyDomain",nameString)
nameString <- gsub('Acc',"Acceleration",nameString)
nameString <- gsub('Mag',"Magnitude",nameString)
names(collectiveData) <- nameString

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

collectiveData = aggregate(collectiveData, by=list(collectiveData$Activity, collectiveData$Subject), mean)
collectiveData <- collectiveData[,1:(ncol(collectiveData)-2)]
colnames(collectiveData)[1] <-"Subject"
colnames(collectiveData)[2] <-"Activity"
write.table(collectiveData, "collective_averaged_dataset.txt")