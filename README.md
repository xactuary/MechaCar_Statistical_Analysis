# MechaCar_Statistical_Analysis
## Background  
MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle. The first part of this analysis will create a model to predict the mpg for each prototype.  The next part will analyze the performance of the suspension coils.

 
## Linear Regression to Predict MPG

A multiple regression analysis is used to determine which input variables are most predictive of the prototype mpg. The data provided is a set of measurement variables for 50 different prototype vehicles. The variables include vehicle length, vehicle weight, spoiler angle, ground clearance, AWD and mpg.  Using the "dplyr" library, a multiple regression model was run using the lm function with all 6 variables in the database.  The goal is to predict the mpg from the other variables so the R statement is 

`lm(mpg~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_DF)`

where MechCar_DF is the dataframe including the data read in from the csv file.   

The results from this statement are:  
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

In the summary output, each Pr(>|t|) value represents the probability that each coefficient contributes a random amount of variance to the linear model. So the smaller this amount, the more likely that the variable IS contributing to the mpg whereas the larger numbers suggest that the variance is random rather than predictive.  So the large PR(>|t|) amounts from this analysis are being generated from vehicle_weight, spoiler_angle, and AWD.  The variables with very small values including the intercept, are the vehicle_length and ground_clearance.   


  The R2 value for this model is reasonably high explaining 71.49% of the variation.  My question, however, is that the variables that seem to be significant are not the ones I would have expected for predicting mileage per gallon.  So I ran a single linear regression separately on each value to see what the R2 is for single regression model.
    
* Variable 1 - vehicle_length  - R2 =37.15,  p-value = 2.632e-06
* Variable 2 - vehicle weight - R2 = .008223,  p-alue = .5311
* Variable 3 - spoiler angle  R2  = .0004343, p-value =.8858
* Variable 4 - ground clearance R2 = .1081, p-value = .01975
* Variable 5 - AWD R2 = .03007, p-value = .3264
  
So this is consistent with the multiple regression.  For some strange reason, the only correlation to mpg is from the vehicle length and ground clearance.  We can see from the following graph, that there is a positive slope and correlation between vehicle length and mpg.  As the prototype vehicle gets longer, the mpg gets bigger.
  
![](  https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/vehlength.PNG)


The biggest R2 on the individual outcomes only explains 37.15% of the mpg whereas the multiple regression explains 70%.  
  
## Summary Statistics on Suspension

### Background
  
 A data file has been provided that gives PSI data on multiple manufacturing lots of weight capacities of multiple suspension coils.  The goal is to see if the manufacturing process is consistent across all production lots.  The design specifications for the MechaCar suspension coils requires that the variance of the suspension coils must not exceed 100 PSI.  
 
 ### Analysis
 
   
 The statistics for the overall manufacturing lots is illustrated in the following table:
   
 
  
![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/totalsummary.PNG )
  
For the total, the PSI variance of 62.29 is less than the control maximum of 100. So, as a whole, this data suggests that the manufacturing meets the design specifications.  To further investigate, we look at the statistics divided into manufacturing lots as displayed in the following table:  

    
![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/lotsummary.PNG )

Looking at separate lots, we can see that Lot 3 has a variance that is higher than the design specifications at 170.29 versus the maximum allowed of 100. Based on this observation we would reject the manufacturing lot 3 as not meeting the design standards needed.

## T test analysis
  The one sample T test is used to determine whether there is a statistical difference between the means of sample datasets versus a hypothesized full population dataset.  We want to determine if the lot means are statistically different from the population mean of 1500.  Our null hypothesis says there is no statistical difference between the sample mean and the population mean - the samples are representative of the population.  The alternate hypothesis is that there is a statistical difference between the observed sample mean and the whole population.  In order to see if Lot 3 really is different than the population, we can use the T test.  
  
  Before applying the t-test, we need to check our sample for the following requirements:
  1.  The input data must be numerical and continuous.  This is true because the PSI is numeric and continuous
  2.  The sample data was selected randomly from its population data.  We use a random sample generator in R to test a sample against the population.
  3.  The input data is considered to be normally distributed - this is usually a reasonable assumption unless we know something else about the data that suggests otherwise. 
  4.  The sample size is reasonably large.  We don't know yet if it is large enough but there are a reasonably large number of observations.
  5.  The variance of the input data should be very similar.  This is hard to know.
    
The first run of the t-test is to do a sample of the total population versus the whole population of the suspension_coil dataset.  (note we are not dividing into manufacturing lots yet).  Plotting the distribution of PSI readings for the whole set results in the following density function:
      
![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/PSISuscoilTable.png)
    
Taking a sample of 50 observations from the dataset results in this density function:
      
 ![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/samplesuscoil.png) 
      
The graphs show basically the same shape and look normally distributed.  The t test is now run on the sample versus the whole population with the following results:
 
 ![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/samplettest.PNG)
 
  The p value resulting from the t test is .5741 which is above our 5%.  This means that the sample did not occur by chance and the means are similar.   The t value is .5658 which isn't very big which implies there isn't a significant difference between the sample mean and the population mean.  Therefore there is not evidence to reject the null hypothesis that there is no statistical difference between the mean of the sample and population. So we accept the null hypothesis that the means of the sample and the population are similar.   
  
We can also run the sample versus the assumed population mean of 1500 (from challenge) which results in the following t test results:

![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/sampvs1500ttest.PNG)

The p value of .1516 is greater than .05 so we accept the null hypothesis that the sample mean is similar to the 1500 assumed total population mean. 
  
Because the company wants to make sure that manufacturing quality is consistent across lots, it is also important to run the t test on a the 3 different manufacturing lots because we noted earlier that lot 3 did not pass the design specifications.  

### Lot 1 t-test
    
 ![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/Lot1graph.png)
 ![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/Lot1ttest.PNG)
 
The lot 1 t-test against the population calculated mean which is 1498.98 results in a very small p value which is less than .05 which means we would reject the null hypothesis that the Lot 1 sample mean is equal to the population mean.  This seems counter-ituitive since the numbers are so close until you look at the plot.  You can see that the variance in results in Lot 1 is so small that the population mean of 1498.78 is way to the left of the sample mean.  So looking at it this way, the t test makes sense.  

We can also run the Lot 1 test against the assumed population mean of 1500.  In this case, the p value = 1. This means the model with population mean=1500 perfectly describes the data in Lot 1 so we accept the null hypothesis that the Lot 1 sample mean is similar to the assumed population mean of 1500.  
 ![]( https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/lot11500.PNG)
 
### Lot 2 t-test 

An examination of the following plot for Lot 2 density, you can see that the variance is now bigger than that in Lot 1 but it is still normally distributed.

 ![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/Lot2plot.png)
 
 Running the t-test against the whole population with mean 1498.78 results in a p value that is less than .05 so we would reject the null hypothesis that the sample mean of 1500.2 is similar to the population mean of 1498.78.  
 
 ![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/lot2ttest.PNG)
 
For Lot 2, if we run the t-test against the assumed population mean of 1500, the p value goes way up to .6072.  This means we would accept the null hypothesis that the mean of Lot 2 is the same as 1500.  Interestingly, the mean is very close to this amount so on a practical basis, this statistical test isn't very helpful.  
 
  ![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/lot1500.PNG)
 

### Lot 3 t-test  


 For Lot 3, if we run the t-test against a population mean of 1500, the p = .04168.  This is less than our standard of .05 so statiscally we would reject the null hypothesis
 ![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/lot3plot.png)
 ![](https://github.com/xactuary/MechaCar_Statistical_Analysis/blob/main/lot3ttest.PNG)
 
The p values on Lots 1 and 2 are both significantly below our 5% threshold.   A smaller p-value means that there is stronger evidence in favor of the alternative hypothesis. 

These t tests are run against the mean on the whole population which is 1498.78.  So the lot1 and lot2 tests against this value reject the null hypothesis.  This is because the true mean is actually 1500.  So we can run the t test against 1500 as well.  

## Study Design: MechaCar vs Competition
 
Based on the Global Consumer Survey of 2018, the top two factors that drive car purchase for consumers are safety and fuel efficiency.  Other factors that buyers would consider is price, handling, maintenance costs and type of vehicle.  

  
  
