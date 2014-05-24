#Readme (Course Project - Getting and Cleaning Data)

The script for the project and the input files are in the 'Main' folder

Load the contents of the 'Main' folder into your working directory or make the 'Main' folder as your working directory.

##Description of the script:
*The script reads the input files (X_train,y_train,X_test,y_test), gathers the data into 4 separate data frames. The data from each data frame is read into a numeric vector each. The 4 vectors thus obtained are combined to form a matrix.

*The y input files give the position corresponding to the X values. y_train files gives the position for which the x value is given in training. Likewise, for the test files.

*Using the y values as factors, 'tapply' function has been applied to X values to calculate means and standard deviations across the 6 positions, namely, Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying.

*Vectors containing the means and standard deviations are combined together in a matrix called 'new_extract' which is later used to build the 'Extracted_data' data frame.

*The Extracted_data data frame is then written in a file called 'Extracts'.

*'Extracts' file contains the means and standard deviations of the Samsung Data across the 6 positions, both in training and testing. 

PS: The code that with in the comments in the script is to read the data from the input files when the input files are present in a different directory other than the working directory.