# frozen_string_literal: true

puts "Ecris une phrase"
string = gets.chomp
puts "choisis un chiffre"
num = gets.chomp.to_i

def chiffre_de_cesar(string, num)
  alphabet = ('a'..'z').to_a
  alphabet_caps = ('A'..'Z').to_a
  modified = alphabet.rotate(num).to_a
  modified_caps = alphabet_caps.rotate(num).to_a
  cripteur = alphabet.zip(modified).to_h
  cripteur_caps = alphabet_caps.zip(modified_caps).to_h
  encrypted = []

  string.each_char do |i|
    if alphabet.include?(i)
      i = cripteur.fetch(i, " ")
    elsif alphabet_caps.include?(i)
      i = cripteur_caps.fetch(i, " ")
    end
    encrypted << i
  end
  encrypted
end

puts chiffre_de_cesar(string, num).join
