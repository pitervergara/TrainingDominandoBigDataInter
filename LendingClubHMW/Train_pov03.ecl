IMPORT LogisticRegression as LR;
IMPORT ML_Core;
IMPORT $;
//Training and Test data
XTrain := $.Convert02_pov.myIndTrainDataNF;
YTrain := $.Convert02_pov.myDepTrainDataNF;
XTest  := $.Convert02_pov.myIndTestDataNF;
YTest  := $.Convert02_pov.myDepTestDataNF;
//Train Logistic Regression Model on LendingClub data
myLearner := LR.BinomialLogisticRegression();
myModel   := myLearner.getModel(XTrain, YTrain);
	 
//Test Logistic Regression Model on LendingClub data
MyPredict := myLearner.Classify(myModel, XTest);
OUTPUT(MyPredict, NAMED('PredictedValues'));
//Assess Logistic Regression model on LendingClub data
MyConfMatrix := LR.Confusion(Ytest,MyPredict);
OUTPUT(MyConfMatrix, NAMED('ConfusionMatrix'), ALL);
// OUTPUT(MyConfMatrix, NAMED('ConfusionMatrix'));
MyConfAccy := LR.BinomialConfusion(MyConfMatrix);
OUTPUT(MyConfAccy, NAMED('ConfusionAccuracy'));	 
	 
//Utilize AIC (Akaike Information Criterion) for model optimization
MyBeta := LR.ExtractBeta(myModel);
OUTPUT(MyBeta, NAMED('BetaValues'));
MyScores := LR.LogitScore(MyBeta,Xtest);
OUTPUT(MyScores , NAMED('ScoreValues'));
MyDeviance := LR.Deviance_Detail(YTest,MyScores);
MyAIC := LR.Model_Deviance(MyDeviance,MyBeta);
OUTPUT(MyAIC, NAMED('AIC'));
   
   
   

