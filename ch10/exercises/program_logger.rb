$nested = ''
def log(description, block)
  $nested += ' '
  puts "#{$nested}Beginning \"#{description}\""
  puts "#{$nested}\"#{description}\" completed... returning #{block.call}"
end

iheartfood = Proc.new do
  whatkind = Proc.new do
    block = Proc.new do
      "Too much!"
    end
    log("WTF", block)
    "Pizza"
  end
  log("What Kind?", whatkind)
  "I love food!"
end

log("Do you love food?", iheartfood)
