#Importing Macronutrients File

Macronutrients <- read.csv("/Users/livingstonakoma/OneDrive/St. Claire College/Semester 4/Capstone Class_ClassFiles_09_08_21/USDA_Macronutrients.csv", stringsAsFactors = FALSE, header = TRUE, sep = ",")
View(Macronutrients)

#Importing Micronutrients File

Micronutrient <- read.csv("/Users/livingstonakoma/OneDrive/St. Claire College/Semester 4/Capstone Class_ClassFiles_09_08_21/USDA_Micronutrients.csv", stringsAsFactors = FALSE, header = TRUE, sep = ",")
View(Micronutrient)

#Merged Table

final_table <- merge(Macronutrients, Micronutrient, by= "ID")

#Checking first six rows

head(final_table)

#Checking data types/class

sapply(final_table, class)

#Removing commas in attribute "Sodium"

final_table$Sodium <- gsub("[,]", " ", final_table$Sodium)

#Removing NA rows where there are NAs in m4 columns

final_table[rowSums(is.na(final_table)) < 5,]

#Checking Number of Rows

nrows(final_table)


#Find missing values in sugar, and replace them with the mean value

SugarMean = mean(final_table$Sugar, na.rm = TRUE)

SugarMean

final_table[is.na(final_table$Sugar),"Sugar"]= SugarMean

final_table

#Finding NA for Vitamin B and Vitamin D, and replacing it with its mean

VitaminEMean = mean(final_table$VitaminE, na.rm = TRUE)  # Vitamin E Mean

VitaminEMean

VitaminDMean = mean(final_table$VitaminD, na.rm = TRUE)  # Vitamin D Mean

VitaminDMean

#Removing all remaining record with missing values. Naming new data set "USDA Clean"

USDA_Clean <- na.omit(final_table)

USDA_Clean

sum(is.na(USDA_Clean))

#Checking data set structure

str(USDA_Clean)
sapply(USDA_Clean, class)
