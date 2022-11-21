source('CleanData.R')
source('ModelingMLE.R')
source('PlotUtils.R')
source('LinearRegDiag.R')
source('linearReg.R')

library(ggplot2)

# clean data
#data = cleanData("/Users/lixiaoyang/insurance_charges_estimation/insurance.csv"); # modify file path name here
#nonsmokerData = subset.data.frame(data, smoker == 'no');
#smokerData = subset.data.frame(data, smoker == 'yes');

# gamma modeling
#nsParams = fitGamma(nonsmokerData$charges);
#print(nsParams);

#sParams = fitGamma(smokerData$charges);
#print(sParams);

# distribution
#par(mfrow = c(1, 2));
#pltGammaMetrics(nonsmokerData$charges, 'nonsmoker', nsParams, 20);
#pltGammaMetrics(smokerData$charges, 'smoker', sParams, 15)

## bmi ~ charges

## ages ~ charges

# nonsmoker
# before
#orig = linearReg(nonsmokerData$age, nonsmokerData$charges, 'age', 'charges', 'nonsmoker', c(0, 35000))
#summary(orig)
#confint(orig, level = 0.95)
# remove bad leverage
#nonsmokerDataClean = cleanBadLeverage(orig, nonsmokerData)
# print(nrow(nonsmokerDataClean))
# after
#curr = linearReg(nonsmokerDataClean$age, nonsmokerDataClean$charges, 'age', 'charges', 'nonsmoker', c(0, 35000))
#summary(curr)
#confint(curr, level = 0.95)

#res = rstandard(curr)
#print(res)
#plot(nonsmokerDataClean$age, res, xlab = 'age', ylab = 'residual', ylim = c(-2, 2))

# smoker
#origS = linearReg(smokerData$age, smokerData$charges, 'age', 'charges', 'smoker', c(0, 50000))
#summary(origS)
#confint(origS, level = 0.95)
# remove bad leverage
#smokerDataClean = cleanBadLeverage(origS, smokerData)
# print(nrow(smokerDataClean))
# before
#currS = linearReg(smokerDataClean$age, smokerDataClean$charges, 'age', 'charges', 'smoker', c(0, 35000))
#summary(currS)
#confint(currS, level = 0.95)

# res = rstandard(curr)
# print(res)
# plot(smokerDataClean$age, res, xlab = 'age', ylab = 'residual', ylim = c(-2, 2))

# ************************************************************************
allData = c(
  'dataset/TRSI.csv',
  'dataset/TRSII.csv',
  'dataset/TRNS.csv'
)
# linearRegression(allData[3])

df = read.csv(file = allData[1])
x = df$age # hard code
y = df$charge # hard code
linearModel = lm(y ~ x)
summary(linearModel)
pltLinearModel(linearModel)

df = cleanBadLeverage(linearModel, df)
x = df$age
y = df$charge
linearModel = lm(y ~ x)
summary(linearModel)
pltLinearModel(linearModel)



temp_var <- predict(linearModel, interval="prediction",level=0.95)
new_df <- cbind(df, temp_var)

ggplot(new_df, aes(age, charge))+
  geom_point() +
  geom_line(aes(y=lwr), color = "red", linetype = "dashed")+
  geom_line(aes(y=upr), color = "red", linetype = "dashed")+
  geom_smooth(method="lm", se=TRUE,level=0.95)

