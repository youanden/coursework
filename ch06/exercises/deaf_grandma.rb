# Starting Deaf Grandma
message = ""
bliss = 0
ignorance = 3
while message
  message = gets.chomp
  if message == "BYE"
    bliss += 1
    break if ignorance == bliss
  else
    bliss = 0
  end

  if message != message.upcase
    puts "HUH?! SPEAK UP, SONNY!"
  else
    puts "NO, NOT SINCE #{rand(21)+1930}!"
  end
end
