#REFRENCES:
	#REFRENCE2:
		#Rodrigo Sardiñas
		#sch17s__ppl__asgmt1__TinyScanner.rb
		#method letter?
		#&&
		#user559633 
		#http://stackoverflow.com/questions/26938262/what-do-and-mean-in-ruby
		
	#REFRENCE3:
		#kjagiello
		#http://stackoverflow.com/questions/2060253/how-to-do-a-newline-in-output

	#REFRENCE4
		#Icid
		#http://stackoverflow.com/questions/4432506/stop-execution-of-ruby-script

	#REFRENCE5
		#Robert Klemme
		#https://www.ruby-forum.com/topic/197975

# bhttps://www.cs.rochester.edu/~brown/173/readings/05_grammars.txt
	#
	#  "TINY" Grammar
	#
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

#
#  Class Scanner - Reads a TINY program and emits tokens
#
class Scanner 
# Constructor - Is passed a file to scan and outputs a token
#               each time nextToken() is invoked.
#   @c        - A one character lookahead 
	def initialize(filename)
		
		if (open_file?(filename) == true) 
			@f = File.open(filename,'r:utf-8') || true rescue false
		end	
				
		if (! @f.eof?)
			@c = @f.getc()
		else
			@c = "!eof!"
			@f.close()
		end
	end
	
	# Method nextCh() returns the next character in the file
	(def nextCh()
		if (! @f.eof?)
			@c = @f.getc()
		else
			@c = "!eof!"
		end
		
		return @c
	end)

	# Method nextToken() reads characters in the file and returns
	# the next token
	(def nextToken() 
		#EOF
		print "eof\n"
		print "letter?: "
		print letter?(@c)
		print "\n"
		(if(@c == "!eof!")
			return Token.new(Token::EOF,"eof")

		#WHITESPACE
		elsif(whitespace?(@c) )
			str =""
			print "whitespace?: "
			print whitespace?(@c) 
			print "\n"
			#collects all whitespace between tokens		
			(while whitespace?(@c)
				str += @c
				nextCh()
			end)
	
			tok = Token.new(Token::WS,str)
			return tok

		#LETTERS
		#collects letter tokens
		elsif(letter?(@c) )
			ltr = @c
			pnt = ""
			print "start letter \n"
				
			
			# (if(ltr == 'p')
			# 	while print?(@c)
			# 		# puts pnt = pnt + @c

			# 		if(pnt == "print")
			# 			tok = Token.new(Token::PRINT,pnt)
			# 			return tok
			# 		end#end of if
			# 		@c.insert()
			# 		nextCh()
			# 	end#end of while
			# end)#end of if
			
			nextCh()

			return Token.new(Token::LTR,ltr)

		#NUMBERS
		elsif(numeric?(@c))
			num = ""
			tok = Token.new(Token::NUMBER,num)
			return tok

		end)#end of if()
		
		(if(3==3) 
			print "if2\n"
		end)

		
	
	end)#end of functin
 	
 	#
		# more code needed here! complete the code here 
		# so that your scanner can correctly recognize
		# and print or display all tokens in our grammar

		# don't want to give back nil token!
		# remember to include some case to handle
		# unknown or unrecognized tokens.
		## tok = Token.new("unknown","unknown")
	
	#
	# Helper methods for Scanner
	#
	def letter?(lookAhead)
		lookAhead =~ /^a|[a-z]|[A-Z]$/
		# print "letter?: "
		# print $~
		# print "\n"
	end

	def numeric?(lookAhead)
		lookAhead =~ /^(\d)+$/
	end

	def whitespace?(lookAhead)
		lookAhead =~ /^(\s)+$/
	end

	#REFRENCE2
	def print?(lookAhead)
		lookAhead =~ /^p|r|i|n|t/
	end

	def operator?(lookAhead)
		lookAhead =~ /\/|\-|\+|\*|\=/
	end

	# Method open_file?
	# exits the program if it cannot open input file
	def open_file?(filename)
		#REFRENCE5|\=
		if(File.open(filename,'r:utf-8').close || true rescue false)
			return true
		else 
			print "ERROR: file cannot be opened \n\n" #REFRENCE3
			exit #REFRENCE4
		end
	end

end
