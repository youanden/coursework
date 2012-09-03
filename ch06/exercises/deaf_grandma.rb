# Starting Deaf Grandma
message = ""
while message
  message = gets.chomp
  break if message == "BYE"
  if message != message.upcase
    puts "HUH?! SPEAK UP, SONNY!"
  else
    puts "NO, NOT SINCE #{rand(21)+1930}!"
  end
end
