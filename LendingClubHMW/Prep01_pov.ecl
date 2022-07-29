IMPORT $;

Lendings := $.File_Lendings.Dataset_Lendings;
ML_Prop  := $.File_Lendings.Layout_Lendings;

EXPORT Prep01_pov := MODULE
  
  EXPORT MLPropExt := RECORD(ML_Prop)
    UNSIGNED4 rnd; // A random number
  END;

  // Adp = Adimplentes / Indp = Inadimplentes
  EXPORT AdpFilter := Lendings.loan_amnt <> 0 AND Lendings.fico_range_low <> 0 AND Lendings.loan_status < 1 AND Lendings.loan_status = 0;
  EXPORT IndpFilter := Lendings.loan_amnt <> 0 AND Lendings.fico_range_low <> 0 AND Lendings.loan_status < 1 AND Lendings.loan_status <> 0;

  EXPORT myDataAdp := PROJECT(Lendings(AdpFilter), TRANSFORM(MLPropExt, 
                                                      SELF.rnd := RANDOM(),
                                                      SELF := LEFT));

  EXPORT myDataIndp := PROJECT(Lendings(IndpFilter), TRANSFORM(MLPropExt, 
                                                        SELF.rnd := RANDOM(),
                                                        SELF := LEFT));

  // Ordena pelo atributo randomico
  EXPORT myDataAdpS := SORT(myDataAdp, rnd);
  EXPORT myDataIndpS := SORT(myDataIndp, rnd);

  // Separa 5K registros de cada classse para treino
  EXPORT myTrainDataAdp := PROJECT(myDataAdpS[1..5000], MLPropExt);
  EXPORT myTrainDataIndp := PROJECT(myDataIndpS[1..5000], MLPropExt);
  
  // Separa 1K registros de cada classe para teste
  EXPORT myTestDataAdp := PROJECT(myDataIndpS[5001..6000], MLPropExt);
  EXPORT myTestDataIndp := PROJECT(myDataIndpS[5001..6000], MLPropExt);
  

  // Junta os exemplos de cada classe em datasets únicos (10K treino, 2K teste)
  EXPORT myTrainDataM := MERGE([myTrainDataAdp, myTrainDataIndp], rnd);  
  EXPORT myTestDataM := MERGE([myTestDataAdp, myTestDataIndp], rnd);  

  EXPORT myTrainData := PROJECT(myTrainDataM[1..10000], ML_Prop);
  EXPORT myTestData :=  PROJECT(myTestDataM[1..2000], ML_Prop);

END;
