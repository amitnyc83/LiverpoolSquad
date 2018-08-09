#CLI Controller

class LiverpoolSquad::CLI

  def call
    list_players
    player_stats
    goodbye
  end

  def list_players
   puts " Welcome to Liverpool Football Club Premier League Team of the season"
  @players = LiverpoolSquad::Player.player_info
  @players.each.with_index(1) do |player, i|
    puts "#{i}. #{player}"
  end
end

  def player_stats
    input = nil
    while input != "exit"
      puts "Select a number from the list below to know more about the player. Type QUIT to exit or type LIST to see squad again"
      input = gets.strip.downcase
      if input.to_i > 0
        player = @players[input.to_i]
        puts "#{player}"
      elsif input == "list"
        list_players
      else
      puts "Invalid input. Select a number from the list below to know more about the player. Type QUIT to exit or type LIST to see squad again "
    end
  end
end


  def goodbye
  puts "Thank you visiting the Liverpool Squad page. See again soon! "
  end



end
