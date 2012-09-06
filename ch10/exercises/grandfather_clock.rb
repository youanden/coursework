def hours_today(block)
  hours = Time.new.hour
  hours += 1 if hours < 12
  hours -= 12 if hours > 12
  hours.times do 
    block.call
  end
end

dong = Proc.new do
  puts 'DONG!'
end

hours_today dong