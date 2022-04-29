require "HTTP"

system "clear"
puts "Please input a word to find its meaning:"
input_word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")
word_data = response.parse(:json)

definition = word_data[0]["text"]
top_example = word_data[0]["exampleUses"][0]["text"]
pronounciation = word_data[0]["textProns"][0]

puts "The definition is: 
#{definition}.
Here is an example of the word in a sentence:
#{top_example}
Here is how you pronounce it:
#{pronounciation}"
