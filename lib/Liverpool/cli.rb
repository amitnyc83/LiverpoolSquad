#CLI Controller
class LiverpoolSquad::CLI
# when ./bin/Liverpool_Squad is entered the call method invoked and the list_players method starts
  def call
    list_players
    player_stats
  end
#list_players method starts by displaying a welcome message
# a variable is created which equals to the player class and calls the squad method in the player class and returns the method
#loops through the stored elements with .each and starts with index from 1
#prints i which is 1 to start and returns elements with .name
#goes back to call and starts the 2nd method in the call method player_stats

  def list_players
   puts "---------------------------------------------------------------------"
   puts " Welcome to Liverpool Football Club Premier League Team of the season"
   puts "---------------------------------------------------------------------"
   LiverpoolSquad::Player.scrape_players
   LiverpoolSquad::Player.all.each.with_index(1) do |player, i|
    puts " #{i}. #{player.name}"
  end
end

  def player_stats
    input = nil
    while input != "exit"
      puts "Select a number from the list above to know more about the player."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= LiverpoolSquad::Player.all.length
        new_player = LiverpoolSquad::Player.all[input.to_i-1]
        puts "---------------------------------------"
        puts "Name:             #{new_player.name}"
        puts "---------------------------------------"
        puts "Squad Number:     #{new_player.number}"
        puts "---------------------------------------"
        puts "Position:         #{new_player.position}"
        puts "---------------------------------------"
        puts "Type Exit to quit or type LIST to see squad again"
        input =gets.strip
        if input.downcase == "list"
          LiverpoolSquad::Player.all.each.with_index(1) do |player, i|
            puts " #{i}. #{player.name}"
          end
      elsif input.downcase == "exit"
        goodbye
      else
      puts "Invalid input.Please type Exit to quit or type List to see squad again "
    end
  end
  end
end


  def goodbye
  puts "Thank you visiting the Liverpool Squad page. See you again soon! "
  end
end
