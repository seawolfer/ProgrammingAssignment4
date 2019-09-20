
Code Book
==========================================================

Information on data: README.MD
	
==========================================================

Steps to clean and prepare the data:

1) Read the files containing labels for activities and features  vector

2) Read test data:

2.1) Read the data identifying subjects for test observations and rename columns

2.2) Read the data containing the feature list for test observations and add descriptions

2.3) Read the data identifying type of activity for test observations and rename columns

2.4) Column bind files under 2.1, 2.2 and 2.3 to get the complete table for test observations

2.5) Keep only necessary columns, Subject.Id, Activity and columns containing mean in their description

2.6) Add the description for activity type to produce the final test data for observations

3) Read training data.

Reproduce steps 2.1 -> 2.6 for training data to final training data for observations 

4) Merge training and test data to create one data set (training & test data have the same format, bound vertically)

5) Reshape the merged data to produce the desired format for data aggregation:
5.1) Use melt function to prepare data for dcast aggregation.

5.2) Aggregate data with dcast function to produce final (tidy) data set

6) Write out csv file the tidy data set in the Data folder.

==========================================================