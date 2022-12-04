source('CleanData.R')
source('ModelingMLE.R')
source('PlotUtils.R')
source('LinearRegDiag.R')
source('linearReg.R')
source('MultiLinearReg.R')
source('rscore.R')
source('ifinPI.R')

library(ggplot2)

allData = c(
  '/Users/lixiaoyang/insurance_charges_estimation/dataset/TRSI.csv',
  '/Users/lixiaoyang/insurance_charges_estimation/dataset/TRSII.csv',
  '/Users/lixiaoyang/insurance_charges_estimation/dataset/TRNS.csv'
)

allData = c(
  'dataset/TRSI.csv',
  'dataset/TRSII.csv',
  'dataset/TRNS.csv'
)

df1 = read.csv(file = allData[1])
x = df1$age # hard code
y = df1$charge # hard code
linearModel = lm(y ~ x)
summary(linearModel)
pltLinearModel(linearModel)

df1 = cleanBadLeverage(linearModel, df1)
x = df1$age
y = df1$charge
linearModel = lm(y ~ x)
summary(linearModel)
pltLinearModel(linearModel)
temp_var <- predict(linearModel, interval="prediction",level=0.95)
new_df1 <- cbind(df1, temp_var)

df2 = read.csv(file = allData[2])
x = df2$age # hard code
y = df2$charge # hard code
linearModel = lm(y ~ x)
summary(linearModel)
pltLinearModel(linearModel)

df2 = cleanBadLeverage(linearModel, df2)
x = df2$age
y = df2$charge
linearModel = lm(y ~ x)
summary(linearModel)
pltLinearModel(linearModel)
temp_var <- predict(linearModel, interval="prediction",level=0.95)
new_df2 <- cbind(df2, temp_var)

new_df<-rbind(new_df2,new_df1)
rscore(new_df$fit,new_df$charge)
ifinPI(new_df$charge,new_df$upr,new_df$lwr)

ggplot(new_df, aes(age, charge))+
  geom_point() +
  geom_line(aes(y=lwr), color = "red", linetype = "dashed")+
  geom_line(aes(y=upr), color = "red", linetype = "dashed")+
  geom_smooth(method="lm", se=TRUE,level=0.95)

#################################################
#######     Multi-linear regression     #########
#################################################

# nonsmoker I

# origin
nonsmokerI = read.csv(allData[1])
model_ = lm(charge ~ age + bmi, data = nonsmokerI)
summary(model_)
par(mfrow = c(2, 2))
plot(model_)

# influence point
par(mfrow = c(1, 1))
influencePlot(model = model_)
nonsmokerI = cleanBadLeverage(model_, nonsmokerI)

# clean
model_ = lm(charge ~ age + bmi, data = nonsmokerI)
summary(model_)
par(mfrow = c(2, 2))
plot(model_)

# avPlot 
par(mfrow = c(1, 2))
avPlots(model = model_)
# crPlot
crPlots(model = model_)
# model compare
anova(lm(charge ~ age, data = nonsmokerI), lm(charge ~ age + bmi, data = nonsmokerI))


# nonsmoker II

# origin
nonsmokerII = read.csv(allData[2])
model_ = lm(charge ~ age + bmi, data = nonsmokerII)
summary(model_)
par(mfrow = c(2, 2))
plot(model_)

# influence point
par(mfrow = c(1, 1))
influencePlot(model = model_)
nonsmokerII = cleanBadLeverage(model_, nonsmokerII)

# clean
model_ = lm(charge ~ age + bmi, data = nonsmokerII)
summary(model_)
par(mfrow = c(2, 2))
plot(model_)

# avPlot 
par(mfrow = c(1, 2))
avPlots(model = model_)
# crPlot
crPlots(model = model_)
# model compare
anova(lm(charge ~ age, data = nonsmokerII), lm(charge ~ age + bmi, data = nonsmokerII))

# smoker

# origin
smoker = read.csv(allData[3])
model_ = lm(charge ~ age + bmi, data = smoker)
summary(model_)
par(mfrow = c(2, 2))
plot(model_)

# influence point
par(mfrow = c(1, 1))
influencePlot(model = model_)
smoker = cleanBadLeverage(model_, smoker)

# clean
model_ = lm(charge ~ age + bmi, data = smoker)
summary(model_)
par(mfrow = c(2, 2))
plot(model_)

# avPlot 
par(mfrow = c(1, 2))
avPlots(model = model_)
# crPlot
crPlots(model = model_)
# model compare
anova(lm(charge ~ age, data = smoker), lm(charge ~ age + bmi, data = smoker))
