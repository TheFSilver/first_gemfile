# frozen_string_literal: true

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

def jean_michel_data(corpus, dictionnaire)
  occurences = Hash.new(0)
  phrase = corpus.split(" ")
  phrase.each do |word|
    dictionnaire.each do |dictionary_word|
      if word.downcase.include?(dictionary_word)
        occurences[dictionary_word] += 1
      end
    end
  end
  print occurences
end

jean_michel_data("below", dictionary) # => {"below"=>1, "low"=>1}

jean_michel_data("Howdy partner, sit down! How's it going?", dictionary) # => {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}
