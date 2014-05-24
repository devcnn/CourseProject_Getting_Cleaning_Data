

#folder_train <- readline(prompt="Enter the path to folder containing training data files:")
#setwd(folder_train)
dataX_train <- read.table("X_train.txt",sep="\t")

dataY_train <- read.table("y_train.txt",sep="\t")

#folder_test <- readline(prompt="Enter the path to folder containing testing data files:")
#setwd(folder_test)
dataX_test <- read.table("X_test.txt",sep="\t")

dataY_test <- read.table("y_test.txt",sep="\t")


n <- max(nrow(dataX_train),nrow(dataX_test))

train_values <- dataX_train[,1]
train_position <- dataY_train[,1]
test_values <- dataX_test[,1]
test_position <- dataY_test[,1]

length(train_values) <- n
length(train_position) <- n
length(test_values) <- n
length(test_position) <- n

combined <- cbind(train_values,train_position,test_values,test_position)

colnames(combined) <- c("Training_Values","Training_Position","Testing_Values","Testing_Position")

positions <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

train_means <- tapply(combined[,"Training_Values"], combined[,"Training_Position"], mean)
names(train_means) <- positions

train_SDs <- tapply(combined[,"Training_Values"], combined[,"Training_Position"], sd)
names(train_SDs) <- positions

test_means <- tapply(combined[,"Testing_Values"], combined[,"Testing_Position"], mean)
names(test_means) <- positions

test_SDs <- tapply(combined[,"Testing_Values"], combined[,"Testing_Position"], sd)
names(test_SDs) <- positions

new_extract <- cbind(train_means,train_SDs,test_means,test_SDs)

colnames(new_extract) <- c("Mean_Training","SD_Training","Mean_Testing","SD_Testing")

rownames(new_extract) <- positions

Extracted_data <- as.data.frame(new_extract)

write.table(Extracted_data,"Extracts.txt",sep="\t",col.names=TRUE,row.names=TRUE)

print("Analysis Completed..Check the Extracts.txt for the measurements data")