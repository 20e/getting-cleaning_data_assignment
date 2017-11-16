# getting-cleaning_data_assignment

This data set is based on the experiments carried out by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, edited by 20e Jiang for the peer-assignment of the coursera course —— getting and cleaning data.

@@ Environment

Please place the "run_analysis.R" in the "UCI HAR Dataset" directory which also contains "test" file, "train" file and some txt files. Then, source this R file, you will get the same dataset as you can see in "20e_Totaldata_tidy.csv" or "20e_Dataset_tidy.txt".

@@ Data

@All the information is from "features.txt","activity_labels.txt","X_test.txt","y_test.txt","subject_test.txt","X_train.txt","y_train.txt","subject_train.txt".

@These datasets "20e_Totaldata_tidy.csv" and "20e_Dataset_tidy.txt" summerize the average of the mean and standard deviation of datas per subject per activity, which means there is only one mean value and one standard deviation for each pair of suject and activity and this mean or standard deviation is the average of according records from original dataset.

@All the datas are grouped by subjects and then activity.

@@ Name

@The "-" and "()" are removed from the names of the dataset.

@The "t"(which represents time-domain) and "f"(which represents "frequence-domain) are all substituted by "time" and "freq"

@@ Save the result

"run_analysis.R" will automatically save this dataset as an csv file in the working directory.
