# MechaCar_Statistical_Analysis
## Background  
MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle. This analysis will create a model to predict the mpg for each prototype.  
### Summary  
Statistical analysis 1 - multiple regression analysis to determine which input variables are most predictive of the prototype mpg. The data provided is a set of measurement variables for 50 different prototype vehicles. The variables include vehicle length, vehicle weight, spoiler angle, ground clearance, AWD and mpg.  The problem is to run a multiple regression model to see which variables may be most predictive of ultimate mpg.  
 
## Linear Regression to Predict MPG
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

In the summary output, each Pr(>|t|) value represents the probability that each coefficient contributes a random amount of variance to the linear model. So the smaller this amount, the more likely that the varialbe IS contributing to the mpg whereas the larger numbers suggest that the variance it contributes is random.  So the large PR(>|t|) amounts from this analysis are being generated from vehicle_weight, spoiler_angle, and AWD.  The variables with very small values incuding the intercept, vehicle_length, and ground_clearance would provide predictive value to the mpg. 


  The R2 value for this model is reasonably high explaining 71.49% of the variation.  My question, however, is that the variables that seem to be significant are not the ones I would have expected for predicting mileage per gallon.  So I ran a single linear regression separately on each value to see what the R2 is for single regression model.
  
Variable 1 - vehicle_length  - R2 =37.15,  p-value = 2.632e-06
Variable 2 - vehicle weight - R2 = .008223,  p-alue = .5311
Variable 3 - spoiler angle  R2  = .0004343, p-value =.8858
Variable 4 - ground clearance R2 = .1081, p-value = .01975
Variable 5 - AWD R2 = .03007, p-value = .3264

So this is consistent with the multiple regression.  For some strange reason, the only correlation to mpg is from the vehicle length and ground clearance.  But the biggest R2 on the individual outcomes only explains 37.15% of the mpg whereas the multiple regression explains 70%.  There is a chance that this example may have the problem of over-modeling.  
  
  
  
