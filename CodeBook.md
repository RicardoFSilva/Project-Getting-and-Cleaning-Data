CodeBook
========

**data1.txt** - File that joins the information related to train and test (does not include **Inertial Signals**)

Column names
- Subject - Id of the subject, from 1 to 30
- ActivityId - Id of the activity, from 1 to 6
- Activity - Activitiy name (1 WALKING, 
2 WALKING_UPSTAIRS
, 3 WALKING_DOWNSTAIRS, 
4 SITTING, 
5 STANDING, 
6 LAYING, the same as in the **activity_labels.txt** file)
	
The following six columns are the same as the first six columns from **x_train** and **x_test** as described in the files **features.txt** and **features_info.txt**
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z

- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z

- Type - Can be Train or Test and allows to divid the dataset in two sets if needed for future analysis

**data2.txt** - File that aggregates the information from **data1.txt**. Ordered by Activity and Subject and agregated by the mean

Column names
- Subject - Id of the subject, from 1 to 30
- Activity - Activitiy name (1 WALKING, 
2 WALKING_UPSTAIRS
, 3 WALKING_DOWNSTAIRS, 
4 SITTING, 
5 STANDING, 
6 LAYING, the same as in the **activity_labels.txt** file)

The following six columns are the same as the first six columns from **x_train** and **x_test** as described in the files **features.txt** and **features_info.txt**
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z

- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
