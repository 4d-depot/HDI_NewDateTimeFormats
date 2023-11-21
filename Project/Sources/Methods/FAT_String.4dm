//%attributes = {}
#DECLARE($id : Integer)->$result : Boolean

var $test : Object

Case of 
	: ($id=1)
		$test:={}
		$test.value:=!2001-01-01!
		$test.format:="G"
		$test.expected:="AD"
	: ($id=2)
		$test:={}
		$test.value:=!2001-01-01!
		$test.format:="GG"
		$test.expected:="AD"
	: ($id=3)
		$test:={}
		$test.value:=!2001-01-01!
		$test.format:="GGG"
		$test.expected:="AD"
	: ($id=4)
		$test:={}
		$test.value:=!2001-01-01!
		$test.format:="GGGG"
		$test.expected:="Anno Domini"
	: ($id=5)
		$test:={}
		$test.value:=!2001-01-01!
		$test.format:="GGGGG"
		$test.expected:="A"
		
	Else 
		
End case 


$string:=String:C10($test.value; $test.format)
$result:=($string#$test.expected)



