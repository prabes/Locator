
class Display 
  
  def self.display(response_hash)
    #Hash of Array of Hashes
    response_hash["results"].each_with_index do |place, i|
      puts "#{i+1}. #{place["name"]}"
    end
  end

end