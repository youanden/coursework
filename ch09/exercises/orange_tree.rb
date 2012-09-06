class OrangeTree
  def initialize
    # The average height of an orange tree is
    # 25 Feet
    @height = 0.0
    @age = 0
    @dead = false
    @orangeCount = 0
  end
  
  def height
    puts "#{@height} feet"
  end
  
  def countTheOranges
    puts "#{@orangeCount} oranges"
  end
  
  def pickAnOrange
    if @orangeCount > 0
      @orangeCount -= 1
      puts "You picked an orange!"
    elsif @dead
      puts "The tree is dead, no more oranges, mate :("
    else
      puts "There are no oranges, try again next year."
    end
  end

  def oneYearPasses
    # Iterate height and age
    if (not @dead)
      @age += 1
      @height += 1 + rand(3) + Math.sqrt(@age) if @height < 50
      # Tree has a increasing chance of dying
      die if rand(5) == rand(5) and @age > 70
    end
    # Iterate fruit production
    if @age > 5 and (not @dead)
      # Purge last year's oranges and produce new oranges
      # The older the tree, the more fruit is produced
      @orangeCount = @height.to_i + rand(@age)
    else
    
    end
  end
  
  def die
    @orangeCount = 0
    @dead = true
    puts "The tree has died. "
  end
end

# Create a new tree
orange_tree = OrangeTree.new

# Death happens randomly over 70 years.
75.times do |i|
  orange_tree.oneYearPasses
  orange_tree.height
  orange_tree.pickAnOrange
  orange_tree.countTheOranges
end
