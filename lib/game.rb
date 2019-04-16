


class Game
  attr_accessor :human_player, :enemies

  def initialize (name)
    @enemies = Array.new

    @enemies << player_1 = Player.new("José")
    @enemies << player_2 = Player.new("Josianne")
    @enemies << player_3 = Player.new("Bob")
    @enemies << player_4 = Player.new("Patrick")
    @human_player = HumanPlayer.new(name)

    show_players
    while self.is_still_ongoing? == true
      self.menu
      self.menu_choice
      self.enemies_attack
      puts ""
      puts "------------Nouveau tour !------------"
      puts @human_player.show_state
    end
    end_game
  end

  # méthode kill_player qui prend un objet Player en entrée et le supprime
  def kill_player (player)
    @enemies.delete (player)
    puts "💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀"
  end
  # méthode is_still_ongoing? qui retourne true si le jeu est toujours en cours
  def is_still_ongoing?
    @human_player.life_points >=0 && !@enemies.empty?
  end

  # méthode show_players qui va afficher 1) l'état du joueur humain et 2) le nombre de joueurs "bots" restant
  def show_players
    puts @human_player.show_state
    puts "Vous avez #{@enemies.count} ennemis !"
  end

  # afficher le menu de choix
  def menu
    puts "⚔️ Quelle action veux-tu effectuer ? ⚔️

    a - chercher une meilleure arme
    s - chercher à se soigner

    attaquer un joueur en vue :"
    @enemies.each {|enemy| (puts "    #{@enemies.index(enemy)} - #{enemy.show_state}")}
  end

  # méthode qui permet de faire réagir le jeu en fonction du choix
  def menu_choice

    choice_ok=false
    while choice_ok == false
      choice = gets.chomp
      if choice == "a"
        human_player.search_weapon
        choice_ok=true
      elsif choice == "s"
        human_player.search_health_pack
        choice_ok=true
      elsif choice == choice.to_i.to_s

        case choice.to_i
        when (0...@enemies.length)
          human_player.attacks @enemies[choice.to_i]
          kill_player(@enemies[choice.to_i]) if @enemies[choice.to_i].life_points <=0
          choice_ok=true
        end
      else
        puts "erreur de saisie : Veuillez entrer à nouveau votre choix :"

      end
    end
  end

  def enemies_attack
    # break if @enemies.is_empty?
    puts ""
    puts "----Les autres joueurs t'attaquent !----"
    @enemies.each do |enemy|
      break if human_player.life_points <= 0
      enemy.attacks human_player
    end
  end

  # Fin du jeu :
  def end_game

    puts "La partie est finie"
    human_player.life_points >0? (puts "🎈 🎊 🎉 BRAVO ! TU AS GAGNE ! 🎉 🎊 🎈"): (puts "💀 💀 💀 Loser ! Tu as perdu ! 💀 💀 💀")
  end

end
