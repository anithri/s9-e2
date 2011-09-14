module Gotham
  class Game

    ACTIONS           = [:solve_crime, :fight_gangs, :rescue_people]
    INITIAL_HOT_SPOTS = 2
    attr_accessor :map, :players, :turns_left, :cards

    def initialize(players, map = nil)
      @map        = map || Gotham::Map.with_players(players)
      @players    = players
      @turns_left = 24
      @cards      = Gotham::Cards.new
    end

    def setup_game
      players.set_starting_locations(@map)
      mk_gotham_dangerous
      return self
    end

    def start_game
      while @turns_left > 0
        players.each do |p|
          puts "\nPlayer: #{p.name}'s turn"

          mk_gotham_worse
          actions = 4
          while actions > 0 do
            puts "actions left: #{actions}"
            puts p.show_area

            actions    -= do_turn(p)
          end
        end

        @turns_left -= 1
      end
    end

    def do_turn(current_player)
      action = turn_prompt(current_player.show_moves)
      if action.kind_of?(Symbol)
        current_player.send(action)
        return 1
      else
        return current_player.move_to(action)
      end
    end

    def turn_prompt(possible_moves)
      all_moves = ACTIONS + possible_moves
      choose *all_moves
    end

    def mk_gotham_dangerous
      (players.player_count + INITIAL_HOT_SPOTS).times do
        @map.random_block.streets += 2
      end
      players.player_count.times do
        @map.random_region.start_disaster
      end
    end

    def mk_gotham_worse
      mk_streets_worse
      mk_disasters_worse
    end

    def mk_disasters_worse
      @map.regions.values.each do |my_region|
        next unless my_region.has_disaster?

        my_region.disaster_area.increase_disaster

        2.times do
          target = my_region.random_block
          if target.trouble_near_by?(:disaster)
            target.increase_disaster
          end
        end
      end
    end

    def mk_streets_worse
      @map.regions.length.times do
        target = @map.random_block

        if target.streets > 0
          target.increase_streets(2)
        elsif target.trouble_near_by?(:streets)
          target.increase_streets
        end
      end
    end
  end
end
