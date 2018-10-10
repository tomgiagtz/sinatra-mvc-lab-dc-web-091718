class PigLatinizer
	@words = []
	def piglatinize(input)
		@input = input
		@words = input.split(" ")
		translate
	end

	def translate
		#get each word
		vowel = /[aeoui]/
		consonant = /[bcdfghjklmnpqrstvwxyz]/
		latin = @words.collect do |word|
			chars = word.split("")
			#if first char matches vowel
			if chars.first.downcase.match(vowel) || chars.size == 1
				word + "way"
				#if begins with 1 or more consonant
			else
				# collect cons at beginning of word
				cons = chars.take_while do |char|
					char.downcase.match(consonant)
				end
				chars.drop(cons.size).join + cons.join + "ay"

			end
		end
		latin.join(" ")
	end
end

# test = "this is a test i am testing pig latin"
# puts PigLatinizer.new(test).translate
