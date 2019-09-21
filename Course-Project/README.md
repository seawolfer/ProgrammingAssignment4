# Coursera *Getting and Cleaning Data* Course project

The following is the description for the project -

>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 
>
>1) A tidy data set as described below, 
>2) A link to a Github repository with your script for performing the analysis, and 
>3) A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
>4) You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
>
>The data used for this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained :
>
>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This repository contains the following files as required by the course review criteria:
- `run_analysis.R`, the R script that was used to create the data set (see the [Creating the data set](#creating-data-set) section below) 
- `tidydataset.txt`, which contains the data set.
- `Code_Book.md`, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data).
- `README.md`, this file, which provides a brief overview of the project.



## Introduction <a name="Introduction"></a>

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data used in this project was collected from the accelerometers from the Samsung Galaxy S smartphone. 

The source data set that this project was based on was obtained from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#), A full description is available at the site where the data was obtained:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
> 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Cleaning the data set <a name="cleaning-data-set"></a>

The R script `run_analysis.R` can be used to create the data set. It retrieves the source data set and transforms it to produce the final data set by performing the following operations :

- Download and unzip source data if it doesn't exist.
- Read data from the working directory.
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the data set.
- Appropriately label the data set with descriptive variable names.
- Create a second, independent tidy set with the average of each variable for each activity and each subject.
- Write the data set to the `tidydataset.txt` file.

The `tidydataset.txt` in this repository was created by running the `run_analysis.R` script using R version 3.4.1 on Windows 7 and requires the `dplyr` package (version 0.7.6 was used).
