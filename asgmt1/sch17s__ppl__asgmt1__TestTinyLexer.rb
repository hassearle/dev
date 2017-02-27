#RESOURCES 
	#REFRENCE1
		#zanbri
		#http://stackoverflow.com/questions/7911669/create-file-in-ruby


load "/home/asearle/dev/asgmt1/sch17s__ppl__asgmt1__TinyToken.rb"
load "/home/asearle/dev/asgmt1/sch17s__ppl__asgmt1__TinyScanner.rb"


# filename.txt below is simply the "source code"
# that you write that adheres to your grammar rules
# if it is in the same directory as this file, you can
# simply include the file name, otherwise, you will need
# to specify the entire path to the file as we did above
# to load the other ruby modules
scan = Scanner.new("sch17s__ppl__asgmt1__input.txt")
tok = scan.nextToken()
@output = ""

while (tok.get_type() != Token::EOF)
   puts "Token: "+"\"" + "#{tok}"+"\"" + " type: #{tok.get_type()}" + "\n"
   #refrence1
   @output << "Token: "+"\"" + "#{tok}"+"\"" + " type: #{tok.get_type()}" + "\n"
   tok = scan.nextToken()
end 

puts "Token: "+"\"" + "#{tok}"+"\"" + " type: #{tok.get_type()}"
@output << "Token: "+"\"" + "#{tok}"+"\"" + " type: #{tok.get_type()}" + "\n"

File.open("kss0024output.txt", "w") {|f| f.write(@output) }