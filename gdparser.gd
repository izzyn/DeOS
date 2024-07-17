extends Node

var keywords = [
	"NAN", "INF", "TAU","PI","void","assert","yield","await","preload","breakpoint","var","enum","const","static","func","signal","self","as","in","is","extends","class_name","class","return","pass","continue","break","match","while","for","else","elif","if",
	"Node","Node2D","Control"
	]

var letters = "abcdefghijklmnopqrstuvwxyz"
var separators = ":{([ ])},<>.;-+/$#~*|^&=?!"

func parse(text : String):
	var separated : bool = true
	var new_text : String = ""
	var word = ""
	
	for chr in text:
		if separated and chr.to_lower() in letters:
			word += chr
		elif chr in separators:
			if word not in keywords:
				new_text += "___"
			separated = true
			new_text+=word
			new_text+=chr
		else:
			separated = false
			if word != "":
				word += chr
			else:
				new_text += chr
		
	pass
