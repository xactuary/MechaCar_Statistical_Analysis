# MechaCar_Statistical_Analysis
## Background  
MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle. This analysis will create a model to predict the mpg for each prototype.  
### Summary  
Statistical analysis 1 - multiple regression analysis to determine which input variables are most predictive of the prototype mpg. The data provided is a set of measurement variables for 50 different prototype vehicles. The variables include vehicle length, vehicle weight, spoiler angle, ground clearance, AWD and mpg.  The problem is to run a multiple regression model to see which variables may be most predictive of ultimate mpg.  
 
## Analysis
Using the "dplyr" library, a multiple regression model was run using the lm function with all 6 variables in the database.  The goal is to predict the mpg from the other variables so the R statement is lm(mpg~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_DF) where MechCar is the dataframe including the data read in from the csv file.   The results from this statement are:  
![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/lmOutput1.PNG)

This implies the following equation:  
Assigning the variable names  
1.  vl = vehicle_length
2.  vw = vehicle_weight
3.  s = spoiler angle
4.  gc = ground clearance
5.  AWD = AWD

Then mpg = 6.237 vl + .001245 vw + 687.7 s + 3.546 gc -3.411 AWD - 104

The summary Statistics on this model are as follows:  

![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/lmSummaryOutput1.PNG)


  
  
