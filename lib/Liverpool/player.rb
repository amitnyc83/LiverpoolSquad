

class LiverpoolSquad::Player

  attr_accessor :name, :number, :position

#when LiverpoolSquad::Player is called in the LiverpoolSquad::CLI list_players method, the squad class method
#calls itself and returns the class method scrape_players
  def self.squad
   self.scrape_players
  end


#the scrape_players class method is called from within the class method self.squad
#it creates an empty array players
#requires Nokogiri and open-uri to scrape players from the site https://www.premierleague.com/clubs/10/Liverpool/squad set to doc
#doc.css selector where the players info is stored is set to list_player
#create a loop with each to loop through each players info and creates a new_player with calling itself with .new
#creates name, nationality, number, position using the css selector
#reads the attrs with the attr_accessor
#push the elements into the players array
#exits the loop and returns the players array with all the elements/attrs
#and returns it to the squad method which then returns it to the CLI class method which called it
  def self.scrape_players
    players = []
    doc = Nokogiri::HTML(open("https://www.premierleague.com/clubs/10/Liverpool/squad"))
    list_player = doc.css("span.playerCardInfo")
    list_player.each do |player|
      new_player = self.new
      new_player.name = player.css("h4.name").text.strip
      new_player.number = player.css("span.number").text.strip
      new_player.position = player.css("span.position").text.strip
      players << new_player
    end
    players
  end
end
