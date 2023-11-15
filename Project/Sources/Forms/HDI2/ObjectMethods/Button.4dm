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
$dateVariations.push(["l"; "ll"; "lll"; "llll"; "lllll"])

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

$timeValues.push("Hour [1-23]")
$timeVariations.push(["H"; "HH"])

$timeValues.push("Hour [0-11]")
$timeVariations.push(["K"; "KK"])

$timeValues.push("Hour [1-24]")
$timeVariations.push(["k"; "kk"])

$timeValues.push("Minute")
$timeVariations.push(["m"; "mm"])

$timeValues.push("Second")
$timeVariations.push(["s"; "ss"])

$timeValues.push("Fraction of second")
$timeVariations.push(["S"; "SS"; "SSS"; "SSSS"])

$timeValues.push("Timezone (ISO-8601 w/ Z)")
$timeVariations.push(["X"; "XX"; "XXX"; "XXXX"; "XXXXX"])

$timeValues.push("Timezone (ISO-8601 w/o Z)")
$timeVariations.push(["x"; "xx"; "xxx"; "xxxx"; "xxxxx"])

$timeValues.push("Timezone (GMT)")
$timeVariations.push(["O"; "OO"; "OOO"; "OOOO"])

$timeValues.push("Timezone (specific non-locat.)")
$timeVariations.push(["z"; "zz"; "zzz"; "zzzz"])


Form:C1466.timeFormats:={}
Form:C1466.timeFormats.values:=$timeValues
Form:C1466.timeFormats.index:=-1
Form:C1466.timeFormats.variations:=$timeVariations
Form:C1466.timeFormats.currentValue:="Select a time format"
