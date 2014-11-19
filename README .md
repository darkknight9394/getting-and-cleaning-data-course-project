Getting and Cleaning Data Course Project
=========================================
This file README.md provides a concise description regarding to the project for Getting and Cleaning data course offered jointly by the Coursera and John Hopkins University. The course material and the work presented herein is a part of the Data Science specialization signature certificate.

The course project considers the cleaning and merging of the data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available in [1] where the data was obtained. A series of tasks have been given to students to perform data cleaning by means of the R programming language as well as some simplified analysis. The project deliverables as stated in the Coursera website [2] are as follows:

1. tidy dataset as described in the Getting and Cleaning data course website [2].
2. the link to a Github repository with your script for performing the analysis.
3. code-book markdown file that describes the variables, the data, and any transformations or work that you performed to clean up, namely CodeBook.md.

Enclosed in this repository are the following items
------------------------------------
* A set of cleaned data stored in collective_averaged_dataset.txt
* __README.md__:    summary of the project aim, deliverables, and operational procedures for the data cleaning process on the UCI HAR Dataset.
* __CodeBook.md__:  description of the variables, the data, and the transformations and analysis performed.
* __run_analysis.R__:   R script for performing data cleaning and analysis.

Description of data
------------------
* The unlabelled features are stored in test/x_test.txt and test/x_train.txt. 
* The activity id are stored in the train/y_test.txt and train/y_train.txt.
* The test subjects are stored in the test/subject_test.txt and train/subject_train.txt.
* The activity labels are stored in the activity_labels.txt.

Description of data cleaning and analysis script
-------------------------------------
The script run_analysis.R merges the unprocessed dataset into a single dataset (collectiveData) where a column bind is performed to combine the data (X, subject, activity), followed by a row bind on the test and the train data. Afterwards, columns with mean and standard deviation are extracted along with the corresponding subject and activity id. The activity id are then lablled using the activity label as a set of character string. Furthermore, a set of transform is performed to enhance the clarity of the column names description. Finally, a tidy dataset with the average of each variable for each activity and each subject are stored in collective_averaged_dataset.txt.

## Step by step guide to perform data cleaning

1. clone repository from [3]
2. download data from [4]
3. unzip the folder and copy the data within the file UCI HAR Dataset to the cloned version of this repository.
4. set the working directory to the cloned version of this repository.
5. run the analysis script by inputting source('run_analysis.R') in R terminal.


References
----------------------
[1] \item  https://class.coursera.org/getdata-009/human_grading/view/courses/972587/assessments/3/submissions

[2] \item http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[3] \item https://github.com/darkknight9394/getting-and-cleaning-data-course-project.git

[4] \item  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
