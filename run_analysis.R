
run_analysis <- function(WD = getwd())
{ 
setwd(WD)  
setwd("UCI HAR Dataset")
WD2 <- getwd()


if (!library(dplyr,logical.return = TRUE))
  {
    install.packages('dplyr',dep=TRUE)
  }

library(dplyr)


features <- read.csv("features.txt", sep = " ", header = FALSE)
features <- features[,2]

Activities <- matrix(1:6,6,2)
Activities[,2]<- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

setwd("test")
subject_test <- read.csv("subject_test.txt", header = FALSE)
y_test <- read.csv("y_test.txt", header = FALSE)
x_test <- read.csv("X_test.txt", sep = "", header = FALSE)
colnames(x_test) <- features
colnames(subject_test) <- "Subject"
colnames(y_test) <- "Activity"
std_test <- x_test[,grep("std()",features)]
mean_test <- x_test[,grep("mean()",features)]
for(i in 1:6){y_test[y_test==i]<- Activities[i,2]}

setwd(WD2)
setwd("train")
subject_train <- read.csv("subject_train.txt", header = FALSE)
y_train <- read.csv("y_train.txt", header = FALSE)
x_train <- read.csv("X_train.txt", sep = "", header = FALSE)
colnames(x_train) <- features
colnames(subject_train) <- "Subject"
colnames(y_train) <- "Activity"
std_train <- x_train[,grep("std()",features)]
mean_train <- x_train[,grep("mean()",features)]
for(i in 1:6){y_train[y_train==i]<- Activities[i,2]}

test_data <- cbind(subject_test, y_test, mean_test, std_test)
train_data <- cbind(subject_train, y_train, mean_train, std_train)

combined_data <- rbind(test_data, train_data)

sorted_data <- combined_data[order(combined_data$Subject,combined_data$Activity),]
tidy_data <- summarise_each(group_by(sorted_data,Subject,Activity),funs(mean))

setwd(WD)

tidy_data
}

