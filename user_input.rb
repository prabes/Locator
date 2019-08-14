class UserInput
  attr_accessor :keyword, :radius
  
  def initialize 
    puts "What are you searching for?"
    @keyword = gets.chomp
    puts "Enter radius in meters:" 
    @radius = gets.chomp
  end    
end
