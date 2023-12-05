var $dateValues; $dateVariations : Collection
var $timeValues; $timeVariations : Collection
var $utcValues; $utcVariations : Collection
var $dateSamples; $timeSamples; $dateTimeSamples : Collection
var $size : Integer

var $i; $n; $index; $page : Integer

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.trace:=False:C215
		Form:C1466.infoES:=ds:C1482.INFO.all().orderBy("pageNumber asc")
		
		Form:C1466.tabs:={}
		Form:C1466.tabs.values:=ds:C1482.INFO.all().orderBy("pageNumber asc").toCollection().extract("tabTitle")
		Form:C1466.tabs.index:=0
		
		vDateInput:=!2023-03-17!
		vTimeInput:=?12:34:56?
		
		Form:C1466.datePattern:=""
		Form:C1466.timePattern:=""
		
		Form:C1466.action:="init"
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Page Change:K2:54)
		
		Form:C1466.action:="page change"
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		Case of 
			: (Form:C1466.action="init")
				
				//-------------------------- Date values and variations ----------------------------------------------------------
				$dateValues:=[]
				$dateVariations:=[]
				
				$dateValues.push("Era")
				$dateVariations.push(["G"; "GG"; "GGG"; "GGGG"; "GGGGG"])
				
				$dateValues.push("Calendar year")
				$dateVariations.push(["y"; "yy"; "yyy"; "yyyy"; "yyyyy"])
				
				$dateValues.push("Local week numbering year")
				$dateVariations.push(["Y"; "YY"; "YYY"; "YYYY"; "YYYYY"])
				
				$dateValues.push("Extended year")
				$dateVariations.push(["u"; "uu"; "uuu"; "uuuu"; "uuuuu"])
				
				$dateValues.push("Quarter (formatting)")
				$dateVariations.push(["Q"; "QQ"; "QQQ"; "QQQQ"; "QQQQQ"])
				
				$dateValues.push("Quarter (stand-alone)")
				$dateVariations.push(["q"; "qq"; "qqq"; "qqqq"; "qqqqq"])
				
				$dateValues.push("Month (formatting)")
				$dateVariations.push(["M"; "MM"; "MMM"; "MMMM"; "MMMMM"])
				
				$dateValues.push("Month (stand-alone)")
				$dateVariations.push(["L"; "LL"; "LLL"; "LLLL"; "LLLLL"])
				
				$dateValues.push("Local week of year")
				$dateVariations.push(["w"; "ww"])
				
				$dateValues.push("Day of month")
				$dateVariations.push(["d"; "dd"])
				
				$dateValues.push("Day of year")
				$dateVariations.push(["D"; "DD"; "DDD"; "DDDD"])
				
				$dateValues.push("Day of week (formatting)")
				$dateVariations.push(["E"; "EE"; "EEE"; "EEEE"; "EEEEE"; "EEEEEE"])
				
				$dateValues.push("Local day of week (formatting)")
				$dateVariations.push(["e"; "ee"; "eee"; "eeee"; "eeeee"; "eeeeee"])
				
				$dateValues.push("Local day of week (stand-alone)")
				$dateVariations.push(["c"; "cc"; "ccc"; "cccc"; "ccccc"; "cccccc"])
				
				
				Form:C1466.dateFormats:={}
				Form:C1466.dateFormats.values:=$dateValues
				Form:C1466.dateFormats.index:=-1
				Form:C1466.dateFormats.variations:=$dateVariations
				Form:C1466.dateFormats.currentValue:="Select a date format"
				
				//-------------------------- Time values and variations ----------------------------------------------------------
				
				$timeValues:=[]
				$timeVariations:=[]
				
				$timeValues.push("AM, PM")
				$timeVariations.push(["a"; "aa"; "aaa"; "aaaa"; "aaaaa"])
				
				$timeValues.push("AM, PM, noon, midnight")
				$timeVariations.push(["b"; "bb"; "bbb"])
				
				$timeValues.push("Flexible day period")
				$timeVariations.push(["B"; "BB"; "BBB"; "BBBB"; "BBBBB"])
				
				$timeValues.push("Hour [1-12]")
				$timeVariations.push(["h"; "hh"])
				
				$timeValues.push("Hour [0-23]")
				$timeVariations.push(["H"; "HH"])
				
				$timeValues.push("Hour [0-11]")
				$timeVariations.push(["K"; "KK"])
				
				$timeValues.push("Hour [1-24]")
				$timeVariations.push(["k"; "kk"])
				
				$timeValues.push("Minute")
				$timeVariations.push(["m"; "mm"])
				
				$timeValues.push("Second")
				$timeVariations.push(["s"; "ss"])
				
				//$timeValues.push("Fraction of second")
				//$timeVariations.push(["S"; "SS"; "SSS"; "SSSS"])
				
				
				
				
				Form:C1466.timeFormats:={}
				Form:C1466.timeFormats.values:=$timeValues
				Form:C1466.timeFormats.index:=-1
				Form:C1466.timeFormats.variations:=$timeVariations
				Form:C1466.timeFormats.currentValue:="Select a time format"
				
				
				//-------------------------- UTC values and variations ----------------------------------------------------------
				
				$utcValues:=[]
				$utcVariations:=[]
				
				$utcValues.push("Timezone (ISO-8601 w/ Z)")
				$utcVariations.push(["X"; "XX"; "XXX"; "XXXX"; "XXXXX"])
				
				$utcValues.push("Timezone (ISO-8601 w/o Z)")
				$utcVariations.push(["x"; "xx"; "xxx"; "xxxx"; "xxxxx"])
				
				$utcValues.push("Timezone (GMT)")
				$utcVariations.push(["O"; "OOOO"])
				
				$utcValues.push("Timezone (specific non-locat.)")
				$utcVariations.push(["z"; "zz"; "zzz"; "zzzz"])
				
				
				Form:C1466.utcFormats:={}
				Form:C1466.utcFormats.values:=$utcValues
				Form:C1466.utcFormats.index:=-1
				Form:C1466.utcFormats.variations:=$utcVariations
				Form:C1466.utcFormats.currentValue:="Select an UTC format"
				
				
				//-------------------------- Sample date and time formats ----------------------------------------------------------
				
				$dateSamples:=[]
				$dateSamples.push("QQQQ yyyy")
				$dateSamples.push("d MMMM yy")
				$dateSamples.push("EEEE d MMM")
				$dateSamples.push("'day' D 'of year' y")
				$dateSamples.push("'week' w 'of year' y")
				Form:C1466.dateSamples:={}
				Form:C1466.dateSamples.values:=$dateSamples
				Form:C1466.dateSamples.index:=-1
				Form:C1466.dateSamples.currentValue:="Select a date format"
				
				
				$timeSamples:=[]
				$timeSamples.push("H 'hours' m 'minuts'")
				$timeSamples.push("h 'hours' m 'minuts' a")
				$timeSamples.push("HH:mm XXX")
				$timeSamples.push("HH:mm:ss xxxxx")
				Form:C1466.timeSamples:={}
				Form:C1466.timeSamples.values:=$timeSamples
				Form:C1466.timeSamples.index:=-1
				Form:C1466.timeSamples.currentValue:="Select a time format"
				
				
				$dateTimeSamples:=[]
				$dateTimeSamples.push("d MMMM yy H 'hours' m 'minuts'")
				$dateTimeSamples.push("d MMM yyyy h 'hours' m 'minuts' a")
				$dateTimeSamples.push("eee d MMM yy HH:mm (O)")
				$dateTimeSamples.push("eeee d MMMM yyyy HH:mm:ss (XXXXX)")
				Form:C1466.dateTimeSamples:={}
				Form:C1466.dateTimeSamples.values:=$dateTimeSamples
				Form:C1466.dateTimeSamples.index:=-1
				Form:C1466.dateTimeSamples.currentValue:="Select a time & time format"
				
				
				Form:C1466.datePattern:=""
				Form:C1466.timePattern:=""
				Form:C1466.dateTimePattern:=""
				
				
				
				Form:C1466.action:="page change"
				SET TIMER:C645(-1)
				
			: (Form:C1466.action="page change")
				$page:=FORM Get current page:C276
				Form:C1466.doc:=Form:C1466.infoES[$page-1].doc
				If (Is Windows:C1573) | (Shift down:C543)
					$size:=16  //22*72dpi/96dpi
				Else 
					$size:=22
				End if 
				ST SET ATTRIBUTES:C1093(*; "RTA_Text_"+String:C10($page); ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; $size)
				
				
				
			: (Form:C1466.action="formatDate")
				
				OBJECT SET VISIBLE:C603(*; "dateSample_@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "dateFormat_@"; False:C215)
				
				$index:=Form:C1466.dateFormats.index
				If ($index>=0)
					$n:=Form:C1466.dateFormats.variations[$index].length
					For ($i; 0; $n-1)
						OBJECT SET TITLE:C194(*; "dateFormat_"+String:C10($i+1); Form:C1466.dateFormats.variations[$index][$i])
						OBJECT SET VALUE:C1742("dateSample_"+String:C10($i+1); String:C10(vDateInput; Form:C1466.dateFormats.variations[$index][$i]))
						
						OBJECT SET VISIBLE:C603(*; "dateFormat_"+String:C10($i+1); True:C214)
						OBJECT SET VISIBLE:C603(*; "dateSample_"+String:C10($i+1); True:C214)
					End for 
					OBJECT SET VISIBLE:C603(*; "arrow_date"; False:C215)
				End if 
				
				Form:C1466.action:="formatUTC"
				SET TIMER:C645(-1)
				
			: (Form:C1466.action="formatTime")
				
				OBJECT SET VISIBLE:C603(*; "timeFormat_@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "timeSample_@"; False:C215)
				
				$index:=Form:C1466.timeFormats.index
				If ($index>=0)
					$n:=Form:C1466.timeFormats.variations[$index].length
					For ($i; 0; $n-1)
						OBJECT SET TITLE:C194(*; "timeFormat_"+String:C10($i+1); Form:C1466.timeFormats.variations[$index][$i])
						OBJECT SET VALUE:C1742("timeSample_"+String:C10($i+1); String:C10(vTimeInput; Form:C1466.timeFormats.variations[$index][$i]))
						
						OBJECT SET VISIBLE:C603(*; "timeFormat_"+String:C10($i+1); True:C214)
						OBJECT SET VISIBLE:C603(*; "timeSample_"+String:C10($i+1); True:C214)
					End for 
					OBJECT SET VISIBLE:C603(*; "arrow_time"; False:C215)
				End if 
				
				Form:C1466.action:="formatUTC"
				SET TIMER:C645(-1)
				
			: (Form:C1466.action="formatUTC")
				
				OBJECT SET VISIBLE:C603(*; "utcFormat_@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "utcSample_@"; False:C215)
				
				$index:=Form:C1466.utcFormats.index
				If ($index>=0)
					$n:=Form:C1466.utcFormats.variations[$index].length
					For ($i; 0; $n-1)
						OBJECT SET TITLE:C194(*; "utcFormat_"+String:C10($i+1); Form:C1466.utcFormats.variations[$index][$i])
						OBJECT SET VALUE:C1742("utcSample_"+String:C10($i+1); String:C10(vDateInput; Form:C1466.utcFormats.variations[$index][$i]; vTimeInput))
						
						OBJECT SET VISIBLE:C603(*; "utcFormat_"+String:C10($i+1); True:C214)
						OBJECT SET VISIBLE:C603(*; "utcSample_"+String:C10($i+1); True:C214)
					End for 
					OBJECT SET VISIBLE:C603(*; "arrow_utc"; False:C215)
				End if 
				
			: (Form:C1466.action="formatSampleDate")
				If (Form:C1466.datePattern#"")
					OBJECT SET FORMAT:C236(*; "dateInputTest"; Form:C1466.datePattern)
					OBJECT SET VALUE:C1742("dateAsString"; String:C10(vDateInput; Form:C1466.datePattern))
					
					OBJECT SET VISIBLE:C603(*; "Arrow_sampleDate"; False:C215)
				End if 
				Form:C1466.action:="formatSampleDateTime"
				SET TIMER:C645(-1)
				
			: (Form:C1466.action="formatSampleTime")
				If (Form:C1466.timePattern#"")
					OBJECT SET FORMAT:C236(*; "timeInputTest"; Form:C1466.timePattern)
					OBJECT SET VALUE:C1742("timeAsString"; String:C10(vTimeInput; Form:C1466.timePattern))
					
					OBJECT SET VISIBLE:C603(*; "Arrow_sampleTime"; False:C215)
				End if 
				Form:C1466.action:="formatSampleDateTime"
				SET TIMER:C645(-1)
				
			: (Form:C1466.action="formatSampleDateTime")
				If (Form:C1466.dateTimePattern#"")
					OBJECT SET VALUE:C1742("dateTimeAsString"; String:C10(vDateInput; Form:C1466.dateTimePattern; vTimeInput))
					
					OBJECT SET VISIBLE:C603(*; "Arrow_sampleDateTime"; False:C215)
				End if 
				
		End case 
End case 

