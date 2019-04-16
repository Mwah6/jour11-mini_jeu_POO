


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
    end
    end_game
  end



  def kill_player (player)
    @enemies.delete (player)
  end

  def is_still_ongoing?
    @human_player.life_points >=0 && !@enemies.empty?
  end

  def show_players
    puts @human_player.show_state
    puts @enemies.each  {|enemy| (enemy.show_state)}
  end

  def menu
    puts "Quelle action veux-tu effectuer ?

    a - chercher une meilleure arme
    s - chercher à se soigner

    attaquer un joueur en vue :"
    @enemies.each {|enemy| (puts "    #{@enemies.index(enemy)} - #{enemy.show_state}")}
  end

  def menu_choice

    choice_ok=false
    while choice_ok == false
      choice = gets.chomp
      # choice = choice.to_i if choice.to_i != nil
      if choice == "a"
        human_player.search_weapon
        choice_ok=true
      elsif choice == "s"
        human_player.search_health_pack
        choice_ok=true
      else choice == choice.to_i.to_s

        case choice.to_i
          # when "a"
          #   human_player.search_weapon
          #   choice_ok=true
          # when "s"
          #   human_player.search_health_pack
          #   choice_ok=true
        when (0...@enemies.length)
          human_player.attacks @enemies[choice.to_i]
          kill_player(@enemies[choice.to_i]) if @enemies[choice.to_i].life_points <=0
          choice_ok=true
        else
          puts "erreur de saisie : Veuillez entrer à nouveau votre choix :"
        end
      end
    end
  end

  def enemies_attack
    # break if @enemies.is_empty?
    puts "Les autres joueurs t'attaquent !"
    @enemies.each do |enemy|
      break if human_player.life_points <= 0
      enemy.attacks human_player
    end
  end

  # Fin du jeu :
  def end_game

    puts "La partie est finie"
    human_player.life_points >0? (puts "BRAVO ! TU AS GAGNE !"): (puts "Loser ! Tu as perdu !")
  end

end




# Crée la classe Game qui aura 2 attr_accessor : un @human_player de type HumanPlayer et un array @enemies qui contiendra des Player.
# Un objet Game s'initialise ainsi : my_game = Game.new("Wolverine"). Il crée automatiquement 4 Player qu'il met dans @enemies et un HumanPlayer portant (dans cet exemple) le nom "Wolverine".
# Écris une méthode kill_player qui prend un objet Player en entrée et le supprime de @enemies. Cette méthode permet d'éliminer un adversaire tué.
# Écris une méthode is_still_ongoing? qui retourne true si le jeu est toujours en cours et false sinon. Le jeu continue tant que le @human_player a encore des points de vie et qu'il reste des Player à combattre dans l’array @enemies.
# Écris une méthode show_players qui va afficher 1) l'état du joueur humain et 2) le nombre de joueurs "bots" restant
# Écris une méthode menu qui va afficher le menu de choix (juste l'afficher, pas plus). On a les mêmes choix que dans la version 2.0 à la seule différence qu'il y a plus de 2 ennemis à combattre et que si un ennemi est mort, on ne doit plus proposer de l'attaquer.
# Écris une méthode menu_choice qui prend en entrée un string. Cette méthode va permettre de faire réagir le jeu en fonction du choix, dans le menu, de l'utilisateur. Par exemple, si l'entrée est "a", le @human_player doit aller chercher une arme. Si l'entrée est "0", on le fait attaquer l'ennemi présenté au choix "0", etc. Pense à faire appel, dans cette méthode, à la méthode kill_player si jamais un Player est tué par le joueur humain !
# Écris une méthode enemies_attack qui va faire riposter tous les ennemis vivants. Ils vont attaquer à tour de rôle le joueur humain.
# Écris une méthode end qui va effectuer l'affichage de fin de jeu. Tu sais, la partie "le jeu est fini" puis "Bravo..." ou "Loser..."
