
class LiverpoolSquad::Player

  attr_accessor :name, :number, :position

  #when LiverpoolSquad::Player is called in the LiverpoolSquad::CLI list_players method, the squad class method
  #calls itself and returns the class method scrape_players
  @@all = []

  def self.all
    @@all
  end

  def save
   @@all << self
  end

  def self.scrape_players
    LiverpoolSquad::Scraper.scrape_players
  end


end
