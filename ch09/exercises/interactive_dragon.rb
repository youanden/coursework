# http://pine.fm/LearnToProgram/?Chapter=09
class Dragon
  
  def initialize name
    @name = name
    @asleep = false
    @stuffInBelly     = 10  #  He's full.
    @stuffInIntestine =  0  #  He doesn't need to go.
    
    puts @name + ' is born.'
  end
  
  def name
    @name
  end
  
  def feed
    puts 'You feed ' + @name + '.'
    @stuffInBelly = 10
    passageOfTime
  end
  
  def walk
    puts 'You walk ' + @name + '.'
    @stuffInIntestine = 0
    passageOfTime
  end
  
  def putToBed
    puts 'You put ' + @name + ' to bed.'
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' snores, filling the room with smoke.'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' wakes up slowly.'
    end
  end
  
  def toss
    puts 'You toss ' + @name + ' up into the air.'
    puts 'He giggles, which singes your eyebrows.'
    passageOfTime
  end
  
  def rock
    puts 'You rock ' + @name + ' gently.'
    @asleep = true
    puts 'He briefly dozes off...'
    passageOfTime
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end
  
  private
  
  #  "private" means that the methods defined here are
  #  methods internal to the object.  (You can feed
  #  your dragon, but you can't ask him if he's hungry.)
  
  def hungry?
    #  Method names can end with "?".
    #  Usually, we only do this if the method
    #  returns true or false, like this:
    @stuffInBelly <= 2
  end
  
  def poopy?
    @stuffInIntestine >= 8
  end
  
  def passageOfTime
    if @stuffInBelly > 0
      #  Move food from belly to intestine.
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else  #  Our dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' is starving!  In desperation, he ate YOU!'
      exit  #  This quits the program.
    end
    
    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts 'Whoops!  ' + @name + ' had an accident...'
    end
    
    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + '\'s stomach grumbles...'
    end
    
    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' does the potty dance...'
    end
  end
  
end

# Initialize Dragon
puts "Give your dragon a name!"
print '> '
$dragon = Dragon.new gets.chomp
commands = ['feed','walk','put to bed','toss','rock','exit']

def list_commands(commands)
  puts "Available Commands"
  commands.each do |command|
    puts "'Feed' => Feed #{$dragon.name}" if command == 'feed'
    puts "'Walk' => Walk #{$dragon.name}" if command == 'walk'
    puts "'Put to bed' => Put #{$dragon.name} to bed" if command == 'put to bed'
    puts "'Toss' => Toss #{$dragon.name} in the air" if command == 'toss'
    puts "'Rock' => Rock #{$dragon.name}" if command == 'rock'
    puts "'Exit' => Leave simulator!" if command == 'exit'
  end
end

def run(command)
  $dragon.feed if command == 'feed'
  $dragon.walk if command == 'walk'
  $dragon.putToBed if command == 'put to bed'
  $dragon.toss if command == 'toss'
  $dragon.rock if command == 'rock'
  exit if command == 'exit'
end

list_commands commands

# Dragon command loop
while true
  print '> '
  command = gets.chomp.downcase
  run(command)
end
