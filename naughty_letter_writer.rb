require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.txt.erb')

kids_data.each_line do |kid|

  first_split = kid.split("|")

  kid_info = first_split[0]

  kid_data_array = kid_info.split
  name     = kid_data_array[0]
  gender   = kid_data_array[1]
  behavior = kid_data_array[2]
  toys     = kid_data_array[3..8]

  infraction = first_split[1]

  random_toy = toys.sample
  if random_toy == "Kaleidoscope"
    random_toy = toys.sample
  else
    random_toy
  end
  random_toy = toys.delete(random_toy)



  other_toys = toys.to_s


  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
