#
#  Class Token - Encapsulates the tokens in TINY
#
#   @type - the type of token
#   @text - the text the token represents
#
class Token
	attr_accessor :type
	attr_accessor :text

	EOF = "eof"
	LPAREN = "("
	RPAREN = ")"
	ADDOP  = "+"
	SUBOP  = "-"
	DEVIDEOP = "/"
	EQUAL = "="
	MULTIOP = "*"
	PRINT = "print"
 

#ashTemp
	# PGM        -->   STMT+
	# STMT       -->   ASSIGN   |   "print"  EXP                           
	# ASSIGN     -->   ID  "="  EXP
	# EXP        -->   TERM   ETAIL
	# ETAIL      -->   "+" TERM   ETAIL  | "-" TERM   ETAIL | EPSILON
	# TERM       -->   FACTOR  TTAIL
	# TTAIL      -->   "*" FACTOR TTAIL  | "/" FACTOR TTAIL | EPSILON
	# FACTOR     -->   "(" EXP ")" | INT | ID   
	#                  
	# ID         -->   ALPHA+
	# ALPHA      -->   a  |  b  | … | z  or 
	#                  A  |  B  | … | Z
	# INT        -->   DIGIT+
	# DIGIT      -->   0  |  1  | …  |  9
	# WHITESPACE -->   Ruby Whitespace




#add the rest of the tokens needed based on the grammar
#specified in the Scanner class "TinyScanner.rb"

	def initialize(type,text)
		@type = type
		@text = text
	end
	
	def get_type
		return @type
	end
	
	def get_text
		return @text
	end
	
	def to_s
	# return "[Type: #{@type} || Text: #{@text}]"
		return "#{@text}"
	end
end
