require_relative "player.rb"
module Gotham
  class PlayerList
    attr_accessor :players, :whose_turn, :available_heroes

    def pregen_chars
      @pregen_chars || {batman:   [3, 3, 3, 3, "Heights", "Batcave"],
                        robin:     [3, 2, 3, 4, "Financial District", "Tower"],
                        nightwing: [3, 4, 2, 3, "Bludhaven", "the Loft"],
                        batgirl:   [4, 3, 2, 3, "Gotham Docks", "Station"],
                        oracle:    [5, 1, 2, 4, "Downtown", "Clocktower"],
                        huntress:  [3, 3, 4, 2, "Little Italy", "Aerie One"]}
    end

    def available_heroes
      @available_heroes
    end

    def initialize
      @players          = []
      @available_heroes = pregen_chars.dup
      @whose_turn       = 0
      @pregen_chars     = pregen_chars
    end

    def add_player(player)
      @players << Gotham::Player.new(player, *pregen_chars[player])
      
      @available_heroes.delete(player)
    end

    def player_regions
      players.collect { |p| p.home }
    end

    def set_starting_locations(map)
      players.each { |p| p.set_starting_location(map) }
    end

    def deal_hands(cards)
      players.each { |p| p.deal_hand(cards) }
    end

    def player_count
      @players.length
    end

    def extra_region_count
      player_count< 4 ? player_count : 4
    end

    def each
      players.each { |e| yield(e) }
    end
  end
end
