#how to read a disk
puts 'Reading from disk'

#f = File.open 'Untitled.txt'

#f.each do |line|
#  puts "the person name is #{line.chomp}!"
#end

File.open('newfile.txt','a') do |f|
f.write 'Hello world'
end
