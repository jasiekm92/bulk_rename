# copy and rename photos from your camra in one click

load 'ChangeMachine.rb'

puts 'Type in source location: ' # eg. /home/jasiek/Desktop/ruby/test/src
src = gets.chomp
puts 'Type in new location: ' # eg. /home/jasiek/Desktop/ruby/test/dst
dst = gets.chomp
puts 'New files name: ' # eg test
name = gets.chomp
puts 'Your file format: ' # eg. .jpg
format = gets.chomp

renamer = ChangeMachine.new(src, dst, name, format)

renamer.start