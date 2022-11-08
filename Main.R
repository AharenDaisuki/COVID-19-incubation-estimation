source('CleanData.R')

main<-function(){
  # modify file path name here
  data = cleanData("/Users/lixiaoyang/insurance_charges_estimation/insurance.csv");
  # print.data.frame(data);
  nonsmokerData = subset.data.frame(data, smoker == 'no');
  smokerData = subset.data.frame(data, smoker == 'yes');
  # print.data.frame(nonsmokerData);
  # print.data.frame(smokerData);
  par(mfrow = c(1, 2))
  hist(nonsmokerData$charges, main = 'nonsmoker', xlab = 'charge');
  hist(smokerData$charges, main = 'smoker', xlab = 'charge');
}

main()

