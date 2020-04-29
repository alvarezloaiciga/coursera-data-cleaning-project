library(dplyr)

descriptiveVariableName <- function(name) {
  name <- sub("^t", "time_", name)
  name <- sub("^f", "frequency_", name)
  name <- sub("Acc", "_acceleration_", name)
  name <- sub("Jerk", "_jerk_", name)
  name <- sub("Gyro", "_gyro_", name)
  name <- gsub("Body?Body", "_body_", name)
  name <- gsub("\\(\\)", "", name)
  name <- gsub("(__|_-|-)", "_", name)
  tolower(name)
}

activities <- function() {
  testDataSetLabels <- read.table("data/test/y_test.txt")
  trainDataSetLabels <- read.table("data/train/y_train.txt")
  activityLabels <- read.table("data/activity_labels.txt")
  
  activities <- rbind(testDataSetLabels, trainDataSetLabels)
  activities <- sapply(activities, function(id) { activityLabels[id, 2] })
  colnames(activities) <- c("activity")
  
  activities
}

subjects <- function() {
  testDataSetSubjects <- read.table("data/test/subject_test.txt")
  trainDataSetSubjects <- read.table("data/train/subject_train.txt")
  
  subjects <- rbind(testDataSetSubjects, trainDataSetSubjects)
  colnames(subjects) <- c("subject")
  
  subjects
}

combinedDataSets <- function() {
  testDataSet <- read.table("data/test/X_test.txt")
  trainDataSet <- read.table("data/train/X_train.txt")
  columnNames <- read.table("data/features.txt")[,2]
  meanAndStandardDeviationColumns <- columnNames[grep("(mean|std)\\(\\)", columnNames)]
  
  dataSet <- rbind(testDataSet, trainDataSet)
  dataSet <- dataSet[, meanAndStandardDeviationColumns]
  
  colnames(dataSet) <- sapply(meanAndStandardDeviationColumns, descriptiveVariableName)
  cbind(subjects(), activities(), dataSet)
}

subjectActivitySummary <- function() {
  dataSet <- tidyDataSet() %>% tbl_df() %>% group_by(subject, activity) %>% summarise_at(vars(-group_cols()), mean)
  write.table(dataSet, "subject_activity_summary.txt", row.name=FALSE)
  dataSet
}