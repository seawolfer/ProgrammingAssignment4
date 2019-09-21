# Code book for Coursera *Getting and Cleaning Data* course project

This code book provides relevant information on the `tidydataset.txt` file of this repository that were generated from the `run_analysis.R` script.

## Original Data & Transformations 

The zip file containing the original data is located at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The following transformations was applied to the original data in order to obtain `tidy_data.txt`:

1. The training and test sets were merged to create one data set.
1. The measurements on the mean and standard deviation (i.e. signals containing the strings `mean` and `std`) was extracted for each measurement, and the others were discarded.
1. The activity identifiers (originally recorded as integers between 1 and 6) was replaced with descriptive activity names taken from a seperate data file.
1. The variable names were replaced with descriptive variable names (e.g. `tBodyAcc-mean()-X` was expanded to `TimeBodyAccelerometerMeanX`), using the following set of rules:
	- Special characters (i.e. `(`, `)`, and `-`) was omitted
	- The initial `f` and `t` was expanded to `Frequency` and `Time` respectively.
	- `Acc`, `Gyro`, `Mag`, `Freq`, `mean`, and `std` was extended to its original word `Accelerometer`, `Gyroscope`, `Magnitude`, `Frequency`, `Mean`, and `StandardDeviation` respectively.
	- Corrected typo `BodyBody` with `Body`.  (supposedly incorrect according to `features_info.txt` file description in the source dataset) 
1. From the cleaned data set in step 4, the final data set was created with the average of each variable for each activity and each subject.


## Data (`tidydataset.txt`)

The `tidy_data.txt` data file is a text file, containing space-separated values, and has a total of 181 rows.

The first row (header) contains the names of the variables, which are listed and described in the Variables section. 

## Variables

This dataset contains 81 variables(columns) in total.
Each row contains 2 identifiers and 79 averaged signal measurements.

### Identifiers

- `Subjects`

	Subject which the data was collected from, integer, ranges from 1 to 30.

- `Activity`

	Activity which the subject was performing when the data point was collected, categorical, with 6 different values: 
	- `WALKING`: subject is walking
	- `WALKING_UPSTAIRS`: subject is walking upstairs
	- `WALKING_DOWNSTAIRS`: subject is walking downstairs
	- `SITTING`: subject is sitting
	- `STANDING`: subject is standing
	- `LAYING`: subject is laying

### Measurements (averaged)

All measurements are float values, normalised and bounded within [-1,1].

Prior to normalisation, acceleration measurements (variables containing `Accelerometer`) were made in *g*'s (9.81 m.s⁻²) and gyroscope measurements (variables containing `Gyroscope`) were made in radians per second (rad.s⁻¹).

Magnitudes of three-dimensional signals (variables containing `Magnitude`) were calculated using the Euclidean norm.

The measurements are classified in two domains:

- Time-domain signals (variables prefixed by `Time), resulting from the capture of accelerometer and gyroscope raw signals.

- Frequency-domain signals (variables prefixed by `Frequency`), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.

#### Time-domain signals

- Average time-domain body acceleration in the X, Y and Z directions:

	- `TimeBodyAccelerometerMeanX`
	- `TimeBodyAccelerometerMeanY`
	- `TimeBodyAccelerometerMeanZ`

- Standard deviation of the time-domain body acceleration in the X, Y and Z directions:

	- `TimeBodyAccelerometerStandardDeviationX`
	- `TimeBodyAccelerometerStandardDeviationY`
	- `TimeBodyAccelerometerStandardDeviationZ`

- Average time-domain gravity acceleration in the X, Y and Z directions:

	- `TimeGravityAccelerometerMeanX`
	- `TimeGravityAccelerometerMeanY`
	- `TimeGravityAccelerometerMeanZ`

- Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions:

	- `TimeGravityAccelerometerStandardDeviationX`
	- `TimeGravityAccelerometerStandardDeviationY`
	- `TimeGravityAccelerometerStandardDeviationZ`

- Average time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `TimeBodyAccelerometerJerkMeanX`
	- `TimeBodyAccelerometerJerkMeanY`
	- `TimeBodyAccelerometerJerkMeanZ`

- Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `TimeBodyAccelerometerJerkStandardDeviationX`
	- `TimeBodyAccelerometerJerkStandardDeviationY`
	- `TimeBodyAccelerometerJerkStandardDeviationZ`

- Average time-domain body angular velocity in the X, Y and Z directions:

	- `TimeBodyGyroscopeMeanX`
	- `TimeBodyGyroscopeMeanY`
	- `TimeBodyGyroscopeMeanZ`

- Standard deviation of the time-domain body angular velocity in the X, Y and Z directions:

	- `TimeBodyGyroscopeStandardDeviationX`
	- `TimeBodyGyroscopeStandardDeviationY`
	- `TimeBodyGyroscopeStandardDeviationZ`

- Average time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:

	- `TimeBodyGyroscopeJerkMeanX`
	- `TimeBodyGyroscopeJerkMeanY`
	- `TimeBodyGyroscopeJerkMeanZ`

- Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:

	- `TimeBodyGyroscopeJerkStandardDeviationX`
	- `TimeBodyGyroscopeJerkStandardDeviationY`
	- `TimeBodyGyroscopeJerkStandardDeviationZ`

- Average and standard deviation of the time-domain magnitude of body acceleration:

	- `TimeBodyAccelerometerMagnitudeMean`
	- `TimeBodyAccelerometerMagnitudeStandardDeviation`

- Average and standard deviation of the time-domain magnitude of gravity acceleration:

	- `TimeGravityAccelerometerMagnitudeMean`
	- `TimeGravityAccelerometerMagnitudeStandardDeviation`

- Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time):

	- `TimeBodyAccelerometerJerkMagnitudeMean`
	- `TimeBodyAccelerometerJerkMagnitudeStandardDeviation`

- Average and standard deviation of the time-domain magnitude of body angular velocity:

	- `TimeBodyGyroscopeMagnitudeMean`
	- `TimeBodyGyroscopeMagnitudeStandardDeviation`

- Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):

	- `TimeBodyGyroscopeJerkMagnitudeMean`
	- `TimeBodyGyroscopeJerkMagnitudeStandardDeviation`

#### Frequency-domain signals

- Average frequency-domain body acceleration in the X, Y and Z directions:

	- `FrequencyBodyAccelerometerMeanX`
	- `FrequencyBodyAccelerometerMeanY`
	- `FrequencyBodyAccelerometerMeanZ`

- Standard deviation of the frequency-domain body acceleration in the X, Y and Z directions:

	- `FrequencyBodyAccelerometerStandardDeviationX`
	- `FrequencyBodyAccelerometerStandardDeviationY`
	- `FrequencyBodyAccelerometerStandardDeviationZ`

- Weighted average of the frequency components of the frequency-domain body acceleration in the X, Y and Z directions:

	- `FrequencyBodyAccelerometerMeanFrequencyX`
	- `FrequencyBodyAccelerometerMeanFrequencyY`
	- `FrequencyBodyAccelerometerMeanFrequencyZ`

- Average frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `FrequencyBodyAccelerometerJerkMeanX`
	- `FrequencyBodyAccelerometerJerkMeanY`
	- `FrequencyBodyAccelerometerJerkMeanZ`

- Standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `FrequencyBodyAccelerometerJerkStandardDeviationX`
	- `FrequencyBodyAccelerometerJerkStandardDeviationY`
	- `FrequencyBodyAccelerometerJerkStandardDeviationZ`

- Weighted average of the frequency components of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `FrequencyBodyAccelerometerJerkMeanFrequencyX`
	- `FrequencyBodyAccelerometerJerkMeanFrequencyY`
	- `FrequencyBodyAccelerometerJerkMeanFrequencyZ`

- Average frequency-domain body angular velocity in the X, Y and Z directions:

	- `FrequencyBodyGyroscopeMeanX`
	- `FrequencyBodyGyroscopeMeanY`
	- `FrequencyBodyGyroscopeMeanZ`

- Standard deviation of the frequency-domain body angular velocity in the X, Y and Z directions:

	- `FrequencyBodyGyroscopeStandardDeviationX`
	- `FrequencyBodyGyroscopeStandardDeviationY`
	- `FrequencyBodyGyroscopeStandardDeviationZ`

- Weighted average of the frequency components of the frequency-domain body angular velocity in the X, Y and Z directions:

	- `FrequencyBodyGyroscopeMeanFrequencyX`
	- `FrequencyBodyGyroscopeMeanFrequencyY`
	- `FrequencyBodyGyroscopeMeanFrequencyZ`

- Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration:

	- `FrequencyBodyAccelerometerMagnitudeMean`
	- `FrequencyBodyAccelerometerMagnitudeStandardDeviation`
	- `FrequencyBodyAccelerometerMagnitudeMeanFrequency`

- Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration jerk (derivation of the acceleration in time):

	- `FrequencyBodyAccelerometerJerkMagnitudeMean`
	- `FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation`
	- `FrequencyBodyAccelerometerJerkMagnitudeMeanFrequency`

- Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity:

	- `FrequencyBodyGyroscopeMagnitudeMean`
	- `FrequencyBodyGyroscopeMagnitudeStandardDeviation`
	- `FrequencyBodyGyroscopeMagnitudeMeanFrequency`

- Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):

	- `FrequencyBodyGyroscopeJerkMagnitudeMean`
	- `FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation`
	- `FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency`




