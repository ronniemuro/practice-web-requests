require "HTTP"

system "clear"
puts "Please input a word to find its meaning:"
input_word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
word_data = response.parse(:json)

definition = word_data[0]["text"]
# top_example =

puts "The definition is: 
#{definition}"
