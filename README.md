Project-Getting-and-Cleaning-Data
=================================

Using the information provided, the data was treated and aggregated into two files:
- data1.txt - joins the train and test data;
- data2.txt - aggregates the joined data to produce the results requested on line 5 of the assignement to produce a second tidy data

This study does not use the information from the "Inertial Signals" directories.

Only the six first columns of files x_train and x_test are used (the names are obtained from the file features.txt):
- 1 tBodyAcc-mean()-X
- 2 tBodyAcc-mean()-Y
- 3 tBodyAcc-mean()-Z
- 4 tBodyAcc-std()-X
- 5 tBodyAcc-std()-Y
- 6 tBodyAcc-std()-Z

The code on file "run_analysis.R" gives the details of all the operations to join and aggregated the data.
The file CodeBook.md gives the details about the columns used on both files:
- data1.txt
- data2.txt
