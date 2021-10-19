#### Agenda ####

# Splitting dataset into train and validation subsets
# Assessing classification models performance

####  ####

#Setting seed for computation reproducibility
set.seed(10)

#Loading data from URL
#read.fwf = Read Fixed Width Format Files
#Dataset description: https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.doc (or in GitHub repo)
DATA_SET = read.fwf("http://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data-numeric", widths = rep(4, 25), header = FALSE)
names(DATA_SET)[25] = "target"
DATA_SET$target = 2 - DATA_SET$target #recoding target variable

# Splitting into train and validation subsets - easier version
rand = sample(1:nrow(DATA_SET),0.8*nrow(DATA_SET)) #random 80% of indexes values
train = DATA_SET[rand,]
val = DATA_SET[-rand,]

# Splitting into train and validation subsets - harder but reuseable version
SplitDataSet = function(data.set, training.fraction){
  random.numbers = sample.int(nrow(data.set))
  quantiles = quantile(random.numbers, probs = c(0, training.fraction, 1))
  split.labels = cut(random.numbers, quantiles, include.lowest = T,
                      labels = c("training", "validation"))
  return(split(data.set, split.labels))
}

set = SplitDataSet(DATA_SET, 0.7)

# Is random sampling the best approach? What if one class has many more records than the other?
# Imbalanced data (undersampling, oversampling, cost-based performance, algorithmic approches e.g.SMOTE)
#https://www.analyticsvidhya.com/blog/2016/03/practical-guide-deal-imbalanced-classification-problems/


#Cost-based approach to assessing the model
CalculateCost = function(cut.off, cost.matrix, score, true.y){
  prediction = ifelse(score > cut.off, 1, 0)
  confusion.matrix = prop.table(table(factor(prediction, levels = c(0, 1)),
                                       true.y))
  return(sum(cost.matrix * confusion.matrix))
}

#Building logistic regression model
#https://en.wikipedia.org/wiki/Logistic_regression
x=seq(-6,6,0.1)
plot(x,1/(1+exp(-x)),"l",ylab="Sigmoid function")
score = costs = list()
model = glm(target ~ ., data = set$training, family = binomial())

#Measuring model performance (cost-based) for different cutoof thresholds and with or without validation dataset
CUT_OFFS = seq(0.5, 1, by = 0.01) 
BAD_CREDIT_COST = 5
LOST_CLIENT_COST = 1
COST_MATRIX = matrix(c(0, BAD_CREDIT_COST, LOST_CLIENT_COST, 0), 2)
#On validation data
score[[1]] = predict(model, newdata = set$validation, type = "response")
costs[[1]] = sapply(CUT_OFFS, CalculateCost, cost.matrix = COST_MATRIX,
                     score = score[[1]], true.y = set$validation$target)
#On training data
score[[2]] = predict(model, type = "response")
costs[[2]] = sapply(CUT_OFFS, CalculateCost, cost.matrix = COST_MATRIX,
                     score = score[[2]], true.y = set$training$target)

#Plotting results
plot(data.frame(CUT_OFFS, 1.1), type = "l", lty = 3, log="y",
     ylim = range(c(1.1, unlist(costs))),
     ylab = "Cost per client", xlab = "Cut-off")
for (i in 1:2) {
  lines(CUT_OFFS, costs[[i]], lty = i, lwd = 2)
  points(CUT_OFFS[which.min(costs[[i]])], min(costs[[i]]),
         pch = 19, cex = 1.3)
}

legend("topright", c("Validation", "Training", "Random"),
       lty = c(1, 2, 3), cex = .7, ncol = 3,
       lwd = c(2, 2, 1))

#What is random outcome?
m=mean(DATA_SET$target)
COST_MATRIX[2,1]*m/2+COST_MATRIX[1,2]*(1-m)/2

#Looks like we got lower cost for predictions on training set, but model may OVERFIT.
#Splitting data into training and validation set is done to avoid overfitting
#and to assess performance in more realistic situation (model will predict outcome on data it has never seen before)

#### Assessing model performance ####
library(ROCR)
set.seed(1)

DATA_SET = read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/statlog/australian/australian.dat", header = F, sep = " ")
names(DATA_SET) = c(paste("A", 1:14, sep = ""), "class")
DATA_SET$A4 = ifelse(DATA_SET$A4 == 1, 0, 1)
DATA_SET$A12 = ifelse(DATA_SET$A12 == 1, 0, 1)
DATA_SET$A14 = log(DATA_SET$A14)

TRAINING_FRACTION = 0.5
training.set.indices = (sample.int(nrow(DATA_SET)) / nrow(DATA_SET) <= TRAINING_FRACTION)
train.set = DATA_SET[training.set.indices, ]
test.set = DATA_SET[!training.set.indices, ]

full.logit = glm(class ~ ., data = train.set, family = binomial)
full.logit
#Feature selection with step() function
#Bayesian information criterion used as assessment criterion
BIC.logit = step(full.logit, k = log(nrow(train.set)), trace = 0)
BIC.logit

# Confusion matrix
pred = ifelse(predict(BIC.logit, type = "response") > 0.7, 1, 0)
conf_matrix = table(train.set$class,pred)
conf_matrix

# Accuracy - percentage of correct predictions
# ACC = (TP + TN)/(TP + FP + TN + FN)
acc = (conf_matrix[1,1]+conf_matrix[2,2])/sum(conf_matrix)

# Precision - percentage of positive predictions which were actually correct
# PREC = TP / (TP + FP)
prec = conf_matrix[2,2]/sum(conf_matrix[,2])

# Recall - what percentage of actual positives were predicted correctly
# Recall / Sensitivity / Hit rate / True Positive Rate (TPR)
# REC = TP / (TP + FN)
rec = conf_matrix[2,2]/sum(conf_matrix[2,])

# Specificity - what percentage of actual negatives were predicted correctly
# Specificity / True Negative Rate
# TNR = TN / (TN + FP)
tnr =  conf_matrix[1,1]/sum(conf_matrix[1,])

# Graphical measures of fit
score.or.class = gain = lift = roc = auc = prediction.object = list()
score.or.class[[1]] = list(test.set$class, test.set$class)
score.or.class[[2]] = list(predict(BIC.logit, type = "response"),
                            train.set$class)
score.or.class[[3]] = list(predict(BIC.logit, new = test.set, "response"),
                            test.set$class)
class.average = mean(test.set$class)
random.class = 1
for (i in 1:(nrow(test.set) - 1)) {
  random.class = c(random.class, mean(random.class) < class.average)
}
score.or.class[[4]] = list(seq(0, 1, len = nrow(test.set)), random.class)
for (i in 1:length(score.or.class)) {
  prediction.object[[i]] = prediction(score.or.class[[i]][[1]],
                                       score.or.class[[i]][[2]])
  gain[[i]] = performance(prediction.object[[i]], "tpr", "rpp")
  lift[[i]] = performance(prediction.object[[i]], "lift", "rpp")
  roc[[i]] = performance(prediction.object[[i]], "tpr", "fpr")
  auc[[i]] = performance(prediction.object[[i]], "auc")
}
LEGEND_LABELS = c("wizard", "training", "test", "random")
#Creating plots
ShowCurve = function(list, name, AUC = FALSE, legend.position = "right") {
  for (i in 1:length(list)) {
    plot(list[[i]], main = paste(name, " curve"),
         col = gray((i - 1) / 4), lwd = 2, add = (i != 1), xlim = c(0, 1))
    if (AUC) {
      text(.2, 0.9 - i * 0.1, pos = 4, col = gray((i - 1) / 4), cex = .9,
           paste("AUC =", round(auc[[i]]@y.values[[1]], digit = 2)))
    }
  }
  legend(legend.position, lty = 2, lwd = 2, col = gray(0:3 / 4),
         y.intersp = .6, legend = LEGEND_LABELS, seg.len = 0.6, bty = "n")
}
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
ShowCurve(gain, "Gain")
ShowCurve(lift, "Lift", legend.position = "topright")
ShowCurve(roc, "ROC", AUC = TRUE)

#Conditional density function
class0.score.density = class1.score.density = list()
max.density = 0
for(i in 1:(length(prediction.object))) {
  predictions = prediction.object[[i]]@predictions[[1]]
  labels = prediction.object[[i]]@labels[[1]]
  class0.score.density[[i]] = density(predictions[labels == "0"],
                                       kernel =  "epanechnikov", bw = 0.05)
  class1.score.density[[i]] = density(predictions[labels == "1"],
                                       kernel =  "epanechnikov", bw = 0.05)
  max.density = max(class0.score.density[[i]]$y,
                     class1.score.density[[i]]$y, max.density)
}   
plot(0, 0, type = "n", xlim = c(-0.1, 1.1), ylim = c(0, max.density),
     xlab = "Score", ylab = "Density function value",
     main = "Conditional score density functions")
for(i in 1:length(prediction.object)) {
  lines(class0.score.density[[i]], col = gray((i - 1) / 4), lwd = 2)
  lines(class1.score.density[[i]], col = gray((i - 1) / 4), lwd = 2, lty = 2)
}
legend("top", lty = 1, lwd = 2, col = gray(0:3 / 4), y.intersp = .6,
       legend = LEGEND_LABELS, seg.len = 0.5, bty = "n")
