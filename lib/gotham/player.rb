module Gotham
  class Player

    attr_accessor :gadget_points, :location
    attr_reader :name, :max_gadget_points, :detecting, :fighting, :bravery,
                :home, :base

    def initialize (name, detecting, fighting, bravery, gadgets, home, base)
      @name          = name
      @detecting     = detecting
      @fighting      = fighting
      @bravery       = bravery
      @gadget_points = @max_gadget_points = gadgets
      @home          = home
      @base          = base
    end

    def to_s
      @name.to_s.capitalize
    end

    def set_starting_location(map)
      @location = map.regions[@home].block(0)
    end

    def show_area
      @location.show_area
    end

    def show_moves
      @location.show_moves
    end

    def move_to(dest)
      destination = @location.region.map.get_block(dest)

      turn_cost = destination.region == @location.region ? 1 : 2
      \
      @location = destination

      return turn_cost
    end

    def calculate_effect(player_level, hazard)
      player_level > hazard ? 2 : 1
    end

    def solve_crime
      #nop
    end

    def fight_gangs
      adj = calculate_effect(@fighting, @location.streets)
      @location.decrease_streets(adj)
    end

    def rescue_people
      adj = calculate_effect(@bravery, @location.disaster)
      @location.decrease_disaster(adj)
    end

  end
end
 
