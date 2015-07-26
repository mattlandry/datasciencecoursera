CodeBook for tidy dataset
=============================

Data source
-----------
"Human Activity Recognition Using Smartphones Data Set" from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Feature Selection 
-----------------
The README and features.txt files in the original dataset speak more to feature selection.

The features selected come from the accelerometer and gyroscope signals tAcc-XYZ and tGyro-XYZ. These signals were captured at 50hz then they were filtered using a median & 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The Acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Fast Fourier Transform (FFT) was applied to some of these signals

The angular velocity and body linear acceleration were derived in time to obtain Jerk signals. 


* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Variables estimated from the signals: 

* mean(): Mean value
* std(): Standard deviation