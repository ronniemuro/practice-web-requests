require "HTTP"

while true
  system "clear"
  puts "Please input a word to find its meaning:"
  input_word = gets.chomp

  #DEFINITIONS
  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
  definitions = response.parse(:json)

  puts "DEFINITIONS:"
  i = 0
  definitions.length.times do
    definition = definitions[i]["text"]
    puts "#{i + 1}. #{definition}."
    i += 1
  end

  #TOP_EXAMPLES
  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
  top_examples = response.parse(:json)

  puts
  puts "TOP EXAMPLES:"
  puts top_examples["text"]

  puts

  #PRONOUNCIATIONS
  response = HTTP.get("https://api.wordnik.com/v4/word.json/slay/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
  pronounciations = response.parse(:json)

  puts "PRONOUNCIATIONS"
  i = 0
  pronounciations.length.times do
    pronounciation = pronounciations[i]["raw"]
    puts "#{i + 1}. #{pronounciation}."
    i += 1
  end
  puts "Press any key to input another word or q to quit program..."
  if input_word == "q"
    break
    puts "Thanks! bye"
  end
end
