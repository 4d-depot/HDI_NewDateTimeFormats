ARRAY DATE:C224(tDates; 0)
ARRAY DATE:C224(tPopDates; 0)
ARRAY DATE:C224(tComboDates; 0)

ARRAY DATE:C224(tTimes; 0)
ARRAY DATE:C224(tPopTimes; 0)
ARRAY DATE:C224(tComboTimes; 0)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		vDate:=!1954-03-17!
		vTime:=?13:24:35?
		Form:C1466.blankIfNull:=False:C215
		
		
		ALL RECORDS:C47([Samples:4])
		//COPY NAMED SELECTION([Samples]; "aSelection")
		SELECTION TO ARRAY:C260([Samples:4]aDate:2; tDates; [Samples:4]aTime:3; tTimes)
		Form:C1466.es:=ds:C1482.Samples.all()
		
		
		UNLOAD RECORD:C212([Samples:4])
		
		
		COPY ARRAY:C226(tDates; tPopDates)
		COPY ARRAY:C226(tDates; tComboDates)
		
		COPY ARRAY:C226(tTimes; tPopTimes)
		COPY ARRAY:C226(tTimes; tComboTimes)
		
		tPopDates:=1
		tPopTimes:=1
		
		tComboDates{0}:=tComboDates{1}
		tComboTimes{0}:=tComboTimes{1}
		
		
End case 
