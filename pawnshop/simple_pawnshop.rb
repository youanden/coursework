# Simple Pawn Shop

# General Item? Product? Vehicle? etc...
$item_prefix = "Item"

# Items array
$items = [
  ['1977 Apple II', 80],
  ['Baseball signed by Babe Ruth', 50],
  ['Copy of the 1974 games Oregon Trail', 10],
  ['Louisville Slugger owned by Babe Ruth', 500],
  ['Complete set of Superman comic books', 100],
  ['Original IBM Model M keyboard', 15],
  ['Paper copy of Chris Pine\'s Learn to Program book', 20],
  ['Leaked pre-release iPhone 5', 5000]
]
$cart = []

# Calculate the literal length of the amount of items (e.g. 10 = 2, 100 = 3)
$prefix = Struct.new(:length).new($item_prefix.length + $items.count.to_s.length)

# Formatted list of items
def list_items(items, options = {})
  cart = options[:cart]
  if cart && items.empty?
    puts "No #{$item_prefix}s in the cart"
  else
    total = 0
    if items.empty?
      puts "Looks like there are no items left to purchase! I'm rich!"
    else
      (items = items).each_with_index do |item,index|
        # Initialize some local variables with the values for easier reading
        iteration = "#{$item_prefix} #{index+1}: "
        item_name = item[0]
        item_price = "$#{item[1]}"
        # Spacer represents the length of the ...'s up to the price without breaking rythm. 
        spacer = 60 - $prefix.length - item_name.length - item_price.length
        print iteration.ljust($prefix.length)
        print item_name.ljust(item.length)
        print "." * spacer
        print item_price.rjust(item_price.length)
        print "\n"
        total += item[1].to_i
        if cart && (index + 1) == items.count
          # Discount Section
          puts "\n"
          
          # If I used hashes for products or classes I could have probably
          # Used the dynamic prices here, but I didn't feel like going that
          # far. :(
          if items.include?(['1977 Apple II', 80]) &&
          items.include?(['Copy of the 1974 games Oregon Trail', 10])
            puts "You've received a 10% discount off of the Apple II and Oregon Trail"
            total = total - (80 * 0.1) - (10 * 0.1)
          end
          
          if items.count > 2
            # Get 5% off if purchasing over 3 items
            total = total - (total * 0.05)
            puts "You've received a 5% discount for buying 3 or more products"
          end
        
          puts "=" * (58 + $prefix.length)
          puts "Total" + "$#{total}".rjust(58) if cart      
        end
      end
    end
  end
end

# List available commands
def list_commands(commands)
  commands.each do |command|
    if command == 'list'
      puts "'List' => Display the list of #{$item_prefix}s available"
    elsif command == 'add'
      puts "'Add' => #{$item_prefix} to your shopping cart"
    elsif command == 'remove'
      puts "'Remove' => #{$item_prefix} from your shopping cart"
    elsif command == 'buy'
      puts "'Buy' => #{$item_prefix}s in your shopping cart"
    elsif command == 'cart'
      puts "'Cart' => #{$item_prefix}s in your cart listed"
    elsif command == 'commands'
      puts "'Commands' => List of available commands"
    elsif command == 'exit'
      puts "'Exit' the program"
    end
  end
end

def add_item(index)
  if $items.count > 0
    if index == -1
      puts "Incorrect format for adding #{$item_prefix}s to your cart? Should be:"
      puts "Add #{$item_prefix} 1, Add #{$item_prefix} 2, etc..."
    elsif index < $items.count
      $cart.push $items[index]
      puts "#{$items[index][0]} has been added to your shopping cart"
      $items.delete $items[index]
    else
      puts "Perhaps your number was out of range? Type 'list' to see available #{$item_prefix}s"
    end
  else
    puts "There are no items remaining in the store, dragonborne."
  end
end

def remove_item(index)
  if $cart.count > 0
    if index < $cart.count
      puts "#{$cart.fetch(index)[0]} has been removed"
      $items.push $cart.fetch(index)
      $cart.delete_at index
    else
      puts "That #{$item_prefix} doesn't exist in your cart, dragonborne."
    end
  else
    puts "There are no #{$item_prefix}s in your cart to remove, dragonborne."
  end
end

def buy(cart)
  if $cart.empty?
    puts "Don't be sneaky, I know you ain't buying anything"
  else
    puts "Thank you!"
    $cart.clear
    # List items for the next customer
    list_items $items
  end
end


# Initialization
commands = ['list','add','remove','buy','cart','commands','exit']
list_items $items
list_commands commands

# Pawn shop loop
while true
  print '> '
  command = gets.chomp.downcase
  clist = command.split
  command = clist[0]
  
  itemid = clist[2].to_i - 1
  
  if command == 'list'
    list_items $items
  elsif command == 'add'
    add_item itemid
  elsif command == 'remove'
    remove_item itemid
  elsif command == 'buy'
    list_items $cart, :cart => true
    buy $cart
  elsif command == 'cart'
    list_items $cart, :cart => true
  elsif command == 'commands'
    list_commands commands
  elsif command == 'exit'
    exit
  else
    puts 'Command not found. Type \'commands\' to see the available commands'
  end
end