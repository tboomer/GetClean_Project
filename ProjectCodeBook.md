#Background
Human Activity Recognition database built from the recordings of 30 subjects between the ages of 19-48 years performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The data for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Variables were estimated from each signal for mean, standard deviation (std) and other statistics. Only mean and standard deviation of the acceleration and gyro measurements are used in this data set. Additional mean variable measurements are included for:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Data Description Source: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#Code Book
## Parts 1-4 (combined.data)
The combined.data data frame contains 10,299 observations of 86 Measured Variables plus 2 factor variables. The 2,947 observations in the test data set were appended to the 7,352 observations in the train data set. The Measured Variables were selected based on the presence of "Mean", "mean", or "std" in the variable names in the features.txt file.

The "subject" variable is factor with an integer value between 1 and 30 identifying the subject of the observation. It is the concatenation of the train and test subject files.

The "activity" variable is a factor with one of six values: walking, walkingupstairs, walkingdownstairs, sitting, standing, laying. It is created by substituting the activity labels for the integer values 1-6 identifying the activity for each observation found in the ytrain and ytest data files.

### Measured Variables

The following variables are all numeric values of the magnitude of observation values. These were derived from the features.txt names by forcing each name to lower case and removing reserved characters. The native abbreviations were retained to keep the variable names from being too long and unwieldy.
The abbreviations are:
*t = time
*f = frequency
*angle = averaged signals in the signal window sample
*body/gravity = the frame against which the variable was measured
*acc/gyro = whether the measurement is acceleration or gyroscopic
*jerk = body linear acceleration and angular velocity derived in time
*x/y/z = the axis of the measurement

The measured variables are:

* "tbodyacc_mean_x"                     
* "tbodyacc_mean_y"                    
* "tbodyacc_mean_z"                     
* "tbodyacc_std_x"                     
* "tbodyacc_std_y"                      
* "tbodyacc_std_z"                     
* "tgravityacc_mean_x"                  
"tgravityacc_mean_y"                 
* "tgravityacc_mean_z"                  
* "tgravityacc_std_x"                  
* "tgravityacc_std_y"                   
* "tgravityacc_std_z"                  
* "tbodyaccjerk_mean_x"                 
* "tbodyaccjerk_mean_y"                
* "tbodyaccjerk_mean_z"                 
* "tbodyaccjerk_std_x"                 
* "tbodyaccjerk_std_y"                  
* "tbodyaccjerk_std_z"                 
* "tbodygyro_mean_x"                    
* "tbodygyro_mean_y"                   
* "tbodygyro_mean_z"                    
* "tbodygyro_std_x"                    
* "tbodygyro_std_y"                     
* "tbodygyro_std_z"                    
* "tbodygyrojerk_mean_x"                
* "tbodygyrojerk_mean_y"               
* "tbodygyrojerk_mean_z"                
* "tbodygyrojerk_std_x"                
* "tbodygyrojerk_std_y"                 
* "tbodygyrojerk_std_z"                
* "tbodyaccmag_mean"                    
* "tbodyaccmag_std"                    
* "tgravityaccmag_mean"                 
* "tgravityaccmag_std"                 
* "tbodyaccjerkmag_mean"                
* "tbodyaccjerkmag_std"                
* "tbodygyromag_mean"                   
* "tbodygyromag_std"                   
* "tbodygyrojerkmag_mean"               
* "tbodygyrojerkmag_std"               
* "fbodyacc_mean_x"                     
* "fbodyacc_mean_y"                    
* "fbodyacc_mean_z"                     
* "fbodyacc_std_x"                     
* "fbodyacc_std_y"                      
* "fbodyacc_std_z"                     
* "fbodyacc_meanfreq_x"                 
* "fbodyacc_meanfreq_y"                
* "fbodyacc_meanfreq_z"                 
* "fbodyaccjerk_mean_x"                
* "fbodyaccjerk_mean_y"                 
* "fbodyaccjerk_mean_z"                
* "fbodyaccjerk_std_x"                  
* "fbodyaccjerk_std_y"                 
* "fbodyaccjerk_std_z"                  
* "fbodyaccjerk_meanfreq_x"            
* "fbodyaccjerk_meanfreq_y"             
* "fbodyaccjerk_meanfreq_z"            
* "fbodygyro_mean_x"                    
* "fbodygyro_mean_y"                   
* "fbodygyro_mean_z"                    
* "fbodygyro_std_x"                    
* "fbodygyro_std_y"                     
* "fbodygyro_std_z"                    
* "fbodygyro_meanfreq_x"                
* "fbodygyro_meanfreq_y"               
* "fbodygyro_meanfreq_z"                
* "fbodyaccmag_mean"                   
* "fbodyaccmag_std"                     
* "fbodyaccmag_meanfreq"               
* "fbodybodyaccjerkmag_mean"            
* "fbodybodyaccjerkmag_std"            
* "fbodybodyaccjerkmag_meanfreq"        
* "fbodybodygyromag_mean"              
* "fbodybodygyromag_std"                
* "fbodybodygyromag_meanfreq"          
* "fbodybodygyrojerkmag_mean"           
* "fbodybodygyrojerkmag_std"           
* "fbodybodygyrojerkmag_meanfreq"       
* "angle_tbodyaccmean_gravity"         
* "angle_tbodyaccjerkmean_gravitymean"  
* "angle_tbodygyromean_gravitymean"    
* "angle_tbodygyrojerkmean_gravitymean" 
* "angle_x_gravitymean"                
* "angle_y_gravitymean"                 
* "angle_z_gravitymean"


## Part 5 (tidy.data)
The variables are the same as Part 1-4 above. However the value for each variable is mean of all observations for each subject/activity combination. As a result there are 180 observations, one for each unique subject/activity combination.
