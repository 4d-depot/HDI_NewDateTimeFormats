Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.infoES:=ds:C1482.INFO.all().orderBy("pageNumber asc")
		
		Form:C1466.tabs:={}
		Form:C1466.tabs.values:=ds:C1482.INFO.all().orderBy("pageNumber asc").toCollection().extract("tabTitle")
		Form:C1466.tabs.index:=0
		
		dateInput:=!2023-03-17!
		timeInput:=?12:34:56?
		datePattern:=""
		timePattern:=""
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Page Change:K2:54)
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		$page:=FORM Get current page:C276
		
		Form:C1466.doc:=Form:C1466.infoES[$page-1].doc
		
End case 

