

class Player
  # Un joueur possède 2 attributs que tu vas mettre en attr_accessor : un nom @name (string) et un niveau de vie @life_points (integer).
  attr_accessor :name, :life_points

  def initialize (name)
    @name = name
    @life_points = 10
  end

  #afficher à l'utilisateur l'état de chaque joueur pour qu'il sache ce qu'il se passe et comment le combat avance.  "XXXX a YYY points de vie".
  def show_state
    return "#{@name} a 0 point de vie ❤️" if @life_points <=0
    return "#{@name} a #{@life_points} points de vie ❤️"
  end

  def gets_damage(damage)
    @life_points -= damage
    puts "le joueur #{@name} a été tué !
    💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀" if @life_points <= 0
  end

  def attacks (other_player)

    puts "le joueur #{@name} attaque le joueur #{other_player.name}"
    damage = self.compute_damage

    puts "il lui inflige #{damage} points de dommages 💔"
    other_player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    return "#{@name} a 0 point de vie  ❤️" if @life_points <=0
    return "#{@name} a #{@life_points} points de vie  ❤️  et une arme de niveau #{@weapon_level}"
  end
  def compute_damage
    return @weapon_level * rand(1..6)
  end

  def search_weapon
    finded_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{finded_weapon_level}"

    if finded_weapon_level > @weapon_level
      @weapon_level = finded_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."

    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    finded_health_pack = rand(1..6)

    case finded_health_pack
    when 1
      puts "Tu n'as rien trouvé... "
    when 2..5
      puts "💞 Bravo, tu as trouvé un pack de +50 points de vie ! 💞"
      @life_points += 50
      @life_points = 100 if self.life_points >100
    when 6
      puts "💞💞💞 Bravo, tu as trouvé un pack de +50 points de vie ! 💞💞💞"
      @life_points += 50
      @life_points = 100 if self.life_points >100
    end
  end
end
