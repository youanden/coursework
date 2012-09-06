age_in_seconds = Time.mktime(1992,5,1,18,5)
billion_seconds = age_in_seconds + 1000000000
now = Time.new

if billion_seconds > now
  puts "I will turn one billion seconds on #{billion_seconds}"
else
  puts "I turned one billion seconds on #{billion_seconds}"
end