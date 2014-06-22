## Getting and Clearning Data Coursera
### Course Project 


#### List of the Files

*	tidy.txt
	The output file containing the tidy data set per the specifications
	The Data set has the dimension of 180 rows, 81 columns.

* 	run_analysis.R
	R script that produces the tidy.txt
	It writes tidy.txt, in the working directory.

*	CODE_BOOK.md
	Explains the features in the tidy.txt


The Samsung Data set should be stored in "UCI HAR Dataset" directory under the working directory in order for the script to work.

#### The process

1. Read X_train and X_test 
2. Read activity labels (y_train and x_train) and subjects (subject_train and subject_test)
3. Combine them with rbind and cbind and add feature names
4. Change the activity labels to more descriptive names
5. Selected columns with mean() or std() using grep function 
6. Removed special characters ("-", "()") from the column labels using gsub function
7. Calculate mean of all the measurements by subject and activity

Select the entire scripts and run from the R console.




