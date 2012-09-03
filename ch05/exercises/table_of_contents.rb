maxwidth = 60
chapters = [
  ["Numbers",1],
  ["Letters",72],
  ["Variables",118]
]

puts "Table of Contents\n"
chapters.each_with_index do |chapter, index|
  puts "Chapter #{index+1}".ljust(maxwidth/3) + "#{chapter[0]}".ljust(maxwidth/3) + "page #{chapter[1]}".rjust(maxwidth/3)
end

