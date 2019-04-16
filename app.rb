require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



player1 = Player.new("José")
player2 = HumanPlayer.new("Josianne")

puts player1.show_state
puts player2.show_state

# def perform
# player1 = Player.new("José")
# player2 = Player.new("Josianne")
# puts player1.show_state
# puts player2.show_state
#
# puts ""
# puts "Passons à la phase d'attaque :"
# puts ""
#
# puts "Josiane aura l'honneur d'attaquer la première :"
# while player1.life_points >0 && player2.life_points >0
#   # break if player2.life_points <= 0
# player2.attacks(player1)
# break if player1.life_points <= 0
# player1.attacks(player2)
# break if player2.life_points <= 0
# puts " -> #{player1.show_state}"
# puts " -> #{player2.show_state}"
# puts ""
# puts "Passons à la phase d'attaque suivante :"
# puts ""
# end
# end
# perform
binding.pry
