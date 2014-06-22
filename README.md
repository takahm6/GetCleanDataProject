## Getting and Clearning Data Coursera
### Course Project 

run_analysis.R produces an output file, tidy.txt, containing the tidy data set required by the project instructions, in the working directory.
The Data set has the dimension of 180 rows, 81 columns.

The Samsung Data set should be stored in "UCI HAR Dataset" directory under the working directory in order for the script to work.

## The process

1. Read X_train and X_test 
2. Read activity labels (y_train and x_train) and subjects (subject_train and subject_test)
3. Combine them with rbind and cbind and add feature names
4. Change the activity labels to more descriptive names
5. Selected columns with mean() or std() using grep function 
6. Removed special characters ("-", "()") from the column labels using gsub function
7. Calculate mean of all the measurements by subject and activity

Select the entire scripts and run from the R console.




