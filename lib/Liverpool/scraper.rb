class LiverpoolSquad::Scraper



def self.scrape_players
  doc = Nokogiri::HTML(open("https://www.premierleague.com/clubs/10/Liverpool/squad"))
  list_player = doc.css("span.playerCardInfo")
  list_player.each do |player|
    new_player = LiverpoolSquad::Player.new
    new_player.name = player.css("h4.name").text.strip
    new_player.number = player.css("span.number").text.strip
    new_player.position = player.css("span.position").text.strip
    new_player.save
  end
end


end
