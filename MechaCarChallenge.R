library(dplyr)
MechaCar_DF <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_DF) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_DF)) #generate summary statistics
lm(mpg ~ vehicle_length,data=MechaCar_DF)
summary(lm(mpg ~ vehicle_length,data=MechaCar_DF))
lm(mpg ~ vehicle_weight,data=MechaCar_DF)
summary(lm(mpg ~ vehicle_weight,data=MechaCar_DF))
lm(mpg ~ spoiler_angle,data=MechaCar_DF)
summary(lm(mpg ~ spoiler_angle,data=MechaCar_DF))
lm(mpg ~ ground_clearance,data=MechaCar_DF)
summary(lm(mpg ~ ground_clearance,data=MechaCar_DF))
lm(mpg ~ AWD,data=MechaCar_DF)
summary(lm(mpg ~ AWD,data=MechaCar_DF))
# check scatter plots
library(ggplot2)
plt <- ggplot(MechaCar_DF,aes(x=mpg,y=vehicle_length)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="vehicle length",y="mpg") + geom_smooth(method="lm") #add scatter plot

plt <- ggplot(MechaCar_DF,aes(x=mpg,y=vehicle_weight)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="vehicle weight",y="mpg") + geom_smooth(method="lm") #add scatter plot

plt <- ggplot(MechaCar_DF,aes(x=mpg,y=spoiler_angle)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="spoiler_angle",y="mpg") + geom_smooth(method="lm") #add scatter plot

plt <- ggplot(MechaCar_DF,aes(x=mpg,y=ground_clearance)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="ground_clearance",y="mpg") + geom_smooth(method="lm") #add scatter plot

plt <- ggplot(MechaCar_DF,aes(x=mpg,y=AWD)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="AWD",y="mpg") + geom_smooth(method="lm") #add scatter plot

# Get summary data for suspension coil PSI for whol and separate lots
SusCoil_Table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
total_summary <- summarize(SusCoil_Table,Mean=mean(PSI), Median=median(PSI), Variance = var(PSI), SD = sd(PSI))
lot_summary <- SusCoil_Table %>% group_by (Manufacturing_Lot) %>%  summarize(mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups='keep')

# Plot density function of the suspension coil data
plt <- ggplot(SusCoil_Table,aes(x=PSI)) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

#take sample from whole table to compare mean to whole table mean
sample_suscoil <- SusCoil_Table %>% sample_n(50) #randomly sample 50 obs

# plot sample to look and see if normally distributed
plt <- ggplot(sample_suscoil,aes(x=PSI)) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# Run t test of sample versus total population
t.test(sample_suscoil$PSI,mu=mean(SusCoil_Table$PSI)) 

# Run t test of sample versus total population presumed mean of 1500
t.test(sample_suscoil$PSI,mu=1500) 

# t test for each of the manufacturing lots
Lot1_DF <-  SusCoil_Table %>% filter(Manufacturing_Lot == "Lot1")
Lot2_DF <-  SusCoil_Table %>% filter(Manufacturing_Lot == "Lot2")
Lot3_DF <-  SusCoil_Table %>% filter(Manufacturing_Lot == "Lot3")
# plot of Lot 1
plt <- ggplot(Lot1_DF,aes(x=PSI)) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot
# t test of Lot 1 versus population average
t.test(subset(SusCoil_Table$PSI, SusCoil_Table$Manufacturing_Lot == "Lot1"), mu=mean(SusCoil_Table$PSI)) 
# t test of Lot 1 versus assumed population mean of 1500
t.test(subset(SusCoil_Table$PSI, SusCoil_Table$Manufacturing_Lot == "Lot1"), mu=1500)
# plot of Lot 2
plt <- ggplot(Lot2_DF,aes(x=PSI)) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot
# t test of Lot 2 versus population average
t.test(subset(SusCoil_Table$PSI, SusCoil_Table$Manufacturing_Lot == "Lot2"), mu=mean(SusCoil_Table$PSI)) 
# t test of Lot 2 versus assumed population mean of 1500
t.test(subset(SusCoil_Table$PSI, SusCoil_Table$Manufacturing_Lot == "Lot2"), mu=1500)
# plot of Lot 3
plt <- ggplot(Lot3_DF,aes(x=PSI)) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot
# t test of Lot 3 versus population average
t.test(subset(SusCoil_Table$PSI, SusCoil_Table$Manufacturing_Lot == "Lot3"), mu=mean(SusCoil_Table$PSI)) 
# t test of Lot 3 versus assumed population mean of 1500
t.test(subset(SusCoil_Table$PSI, SusCoil_Table$Manufacturing_Lot == "Lot3"), mu=1500)




