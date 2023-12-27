//%attributes = {}
var $i : Integer

$e:=ds:C1482.Samples.all().drop()

For ($i; 1; 12)
	$e:=ds:C1482.Samples.new()
	$e.aDate:=Add to date:C393(!2021-01-01!; $i-1; $i-1; $i-1)
	$e.aTime:=(3600*$i)+(($i+1)*60*7)+(($i+2)*13)
	$e.save()
	
End for 