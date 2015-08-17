# Getting-and-Cleaning-Data

This script requires that the working directory used when the function is called, or the directory passed to the function, contain the UCI HAR Dataset. If the dataset is not present, an error message will be returned.

The R script "tidy.R" defines a function, tidy, which reads, combines and summarizes data in the Human Activity Recognition Using Smartphones Dataset. The test and train datasets are read in and the columns are combined. The combined test and train datasets are then merged and the integer values for the activities label, y, are then replaced with descriptive names. Finally, the data is filtered to only include variable representing the mean and standard deviations and these variables are averaged for each activity and subject.
