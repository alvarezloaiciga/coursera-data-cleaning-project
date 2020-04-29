# Getting and cleaning data course project

This project summarizes the data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.

All the data is located in the [data](./data) folder. This contains multiple files that represent multiple sets of data.
You can read more about how the experiment was executed in [this](./data/README.txt) file.

## Cleaning the data
In order to clean the data and summarise it for a better use, I followed these steps:

- Merged the training and the test sets to create one data set
- Extracted only the measurements on the mean and standard deviation for each measurement using regular expressions.
- Mapped the activity names and subjects to each of the measurements.
- Renamed all the variables using regular expressions and real words. All of them will be lowercase and words are separated by _.
- Generates a summary of those measurements for each of the activities that each of the subject did.

## Code book
You can read the [code book](./CodeBook.md) to know additional details about the variables that are included in the resulting data set.

## Recipe Script / How to run it
1. Step one: Clone the project
2. Step two: Open course-project.Rproj
3. Step three: Execute `subjectActivitySummary()` in the console
4. Step four: Use the generated output as the summary data set

You can alse find the generated file in: [subject_activity_summary.txt](./subject_activity_summary.txt) on this repository

This project was generated using the following dependencies:

MacOS: 10.15.4 (Catalina)
RStudio: Version 1.2.5042
R: Version 3.6.3