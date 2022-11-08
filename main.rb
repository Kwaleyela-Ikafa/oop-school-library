require './app'

def main
  puts 'Welcome to The OOP School Library Application'
  school = App.new
  loop do
    school.menu
  end
end

main
