Variables

* 'features_info.txt': Shows information about the variables used on the feature vector.

*  'features.txt': List of all features.

*  'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

*  'train/y_train.txt': Training labels.

*  'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

*  x_data_train, y_data_train and subject_data merge the previous datasets to further analysis.

* features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.

* all_data merges x_data, y_data and subject_data in a big dataset.

* Finally, averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.


