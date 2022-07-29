IMPORT $, DataPatterns;

//Dataset bruto
FileRaw := $.File_raw.Dataset_raw;
// OUTPUT(FileRaw);
// COUNT(FileRaw);

//Perfilamento dos dados
// DataPatterns.Profile(FileRaw);
// DataPatterns.BestRecordStructure(FileRaw,,,TRUE);
// DataPatterns.Profile($.File_Optimized.Dataset_Optimized);

//Dataset filtrado com loan_status (0/1)
// OUTPUT($.File_Binomial.Dataset_binomial);
// OUTPUT(DataPatterns.Profile($.File_Binomial.Dataset_binomial),ALL);

//Dataset filtrado com campos de interesse
// $.File_Lendings.Dataset_Lendings;

//Dataset limpo e com campo aleatório
// OUTPUT($.Prep01.myDataE,NAMED('CleanLendings'));
// COUNT($.Prep01.myDataE);

OUTPUT($.Prep01_pov.myDataAdp,NAMED('CleanLendingsADP'));
COUNT($.Prep01_pov.myDataAdp);

OUTPUT($.Prep01_pov.myDataAdp,NAMED('CleanLendingsINDP'));
COUNT($.Prep01_pov.myDataAdp);


//Amostras de treinamento e teste
// OUTPUT($.Prep01_pov.myTrainData,NAMED('TrainData'));
// COUNT($.Prep01_pov.myTrainData);
// OUTPUT($.Prep01_pov.myTestData,NAMED('TestData'));
// COUNT($.Prep01_pov.myTestData);

//Variáveis dependentes e independentes para treinamento e teste em formato data frame
// OUTPUT($.Convert02.myIndTrainDataNF,NAMED('IndTrain'));
// OUTPUT($.Convert02.myDepTrainDataNF,NAMED('DepTrain'));
// OUTPUT($.Convert02.myIndTestDataNF,NAMED('IndTest'));
// OUTPUT($.Convert02.myDepTestDataNF,NAMED('DepTest'));