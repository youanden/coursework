# Leap Years Program
print 'Starting year: '
start_year = gets.chomp.to_i
print 'Ending year: '
ending_year = gets.chomp.to_i

while start_year <= ending_year
  if start_year % 4 == 0

    leap_year = true

    if start_year % 100 == 0
      leap_year = false unless start_year % 400 == 0
    end

    puts start_year if leap_year
  end
  
# Prep for next iteration
leap_year = false
start_year += 1

end 
