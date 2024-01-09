ARRAY DATE:C224(tDates; 0)
ARRAY DATE:C224(tPopDates; 0)
ARRAY DATE:C224(tComboDates; 0)
//ARRAY DATE(tTabDates; 0)

ARRAY TIME:C1223(tTimes; 0)
ARRAY TIME:C1223(tPopTimes; 0)
ARRAY TIME:C1223(tComboTimes; 0)


ARRAY TEXT:C222(tComboText; 3)
ARRAY REAL:C219(tComboNum; 3)

tComboText{1}:="ALPHABRAVO"
tComboText{2}:="CHARLIEDELTA"
tComboText{3}:="ECHOFOXTROT"

tComboText{0}:=tComboText{1}

tComboNum{1}:=1000/3
tComboNum{2}:=1000/7
tComboNum{3}:=1000/11

tComboNum{0}:=tComboNum{1}

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
		//COPY ARRAY(tDates; tTabDates)
		//ARRAY DATE(tTabDates; 3)  // limit to three !
		
		
		COPY ARRAY:C226(tTimes; tPopTimes)
		COPY ARRAY:C226(tTimes; tComboTimes)
		
		tPopDates:=1
		tPopTimes:=1
		
		tComboDates{0}:=tComboDates{1}
		tComboTimes{0}:=tComboTimes{1}
		
		Form:C1466.popDates:={}
		Form:C1466.popDates.values:=Form:C1466.es.toCollection().extract("aDate")
		Form:C1466.popDates.index:=1
		
		Form:C1466.comboDates:={}
		Form:C1466.comboDates.values:=Form:C1466.es.toCollection().extract("aDate")
		Form:C1466.comboDates.currentValue:=Form:C1466.comboDates.values[0]
		
		
		Form:C1466.popTimes:={}
		Form:C1466.popTimes.values:=Form:C1466.es.toCollection().extract("aTime")
		Form:C1466.popTimes.index:=1
		
		Form:C1466.comboTimes:={}
		Form:C1466.comboTimes.values:=Form:C1466.es.toCollection().extract("aTime")
		Form:C1466.comboTimes.currentValue:=Form:C1466.comboTimes.values[0]
		
		Form:C1466.tabDates:=OB Copy:C1225(Form:C1466.popDates)
		Form:C1466.tabDates.values:=Form:C1466.tabDates.values.slice(0; 3)
		
		
End case 
