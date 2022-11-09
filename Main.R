source('CleanData.R')
source('ModelingMLE.R')
source('PlotUtils.R')

 library(fitdistrplus)

# clean data
data = cleanData("/Users/lixiaoyang/insurance_charges_estimation/insurance.csv"); # modify file path name here
nonsmokerData = subset.data.frame(data, smoker == 'no');
smokerData = subset.data.frame(data, smoker == 'yes');

# gamma modeling
nsParams = fitGamma(nonsmokerData$charges);
print(nsParams);
fitdist(nonsmokerData$charges, 'gamma');
sParams = fitGamma(smokerData$charges);
print(sParams);
summary(goodfit(smokerData$charges), 'gamma');

# distribution
par(mfrow = c(1, 2));
pltGammaMetrics(nonsmokerData$charges, 'nonsmoker', nsParams, 20);
pltGammaMetrics(smokerData$charges, 'smoker', sParams, 15)

