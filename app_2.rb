require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perform
  # Accueil :
  puts "-------------------------------------------------
  |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
  |Le but du jeu est d'être le dernier survivant !|
  -------------------------------------------------"

  # Initialisation du joueur :
  puts "Quel est ton petit nom ?"
  print " >"

  human_player = HumanPlayer.new(gets.chomp)

  # Initialisation des ennemis :
    enemies_array = []
  enemies_array << player1 = Player.new("José")
  enemies_array << player2 = Player.new("Josianne")
  # player1 = Player.new("José")
  # player2 = Player.new("Josianne")
  # enemies_array = []
  # enemies_array << player1
  # enemies_array << player2

  # Le combat :
  while human_player.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    puts human_player.show_state
    puts "Quelle action veux-tu effectuer ?

    a - chercher une meilleure arme
    s - chercher à se soigner

    attaquer un joueur en vue :
    0 - #{player1.show_state}
    1 - #{player2.show_state}"
    choice_ok=false
    while choice_ok == false
      choice = gets.chomp
      case choice
      when "a"
        human_player.search_weapon
        choice_ok=true
      when "s"
        human_player.search_health_pack
        choice_ok=true
      when "0"
        human_player.attacks player1
        choice_ok=true
      when "1"
        human_player.attacks player2
        choice_ok=true
      else
        puts "erreur de saisie : Veuillez entrer à nouveau votre choix :"
      end
    end
    break if enemies_array.map { |enemy|  enemy = enemy.life_points}.all?(&(:negative?||:null?))

    puts "Les autres joueurs t'attaquent !"
    enemies_array.each do |enemy|
      break if human_player.life_points <= 0
      enemy.attacks human_player if enemy.life_points > 0

    end
  end
  # Fin du jeu :
  puts "La partie est finie"
  human_player.life_points >0? (puts "BRAVO ! TU AS GAGNE !"): (puts "Loser ! Tu as perdu !")

end

perform





# player1 = Player.new("José")
# player2 = HumanPlayer.new("Josianne")
#
# puts player1.show_state
# puts player2.show_state

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
# binding.pry
