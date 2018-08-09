
class LiverpoolSquad::Player

  attr_accessor :name, :nationality, :number, :position, :appearances, :clean_sheets, :goals


  def self.player_info
   self.scrape_liverpool_squad
  end


  def self.scrape_liverpool_squad
   @players = []

    player = self.new
    player.name = doc.css("h4.name").text
    player.nationality = doc.css("span.playerCountry").text
    player.number = doc.css("span.number").text
    player.position = doc.css("span.position").text
    player.appearances = doc.css("").text
    player.clean_sheets = doc.css("").text
    player.goals = doc.css("").text

    players
  end
