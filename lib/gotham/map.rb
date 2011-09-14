require_relative 'region.rb'
module Gotham
  class Map

    attr_accessor :regions, :map

    def self.with_players(players)
      all_regions = Gotham.base_regions
      all_regions += players.player_regions
      self.new(*all_regions)
    end

    def initialize(*region_list)
      region_list.shuffle!
      @regions = {}
      region_list.each do |region|
        @regions[region] = Gotham::Region.new(self, region)
      end

      rl = region_list.dup
      case region_list.length
        when 3
          @regions[rl[0]].add_connection(@regions[rl[1]])
          @regions[rl[0]].add_connection(@regions[rl[2]])
          @regions[rl[1]].add_connection(@regions[rl[1]])
          @map = [[@regions[rl[0]], @regions[rl[1]]],
                  [@regions[rl[2]]]]
        when 4
          @regions[rl[0]].add_connection(@regions[rl[1]])
          @regions[rl[0]].add_connection(@regions[rl[2]])
          @regions[rl[1]].add_connection(@regions[rl[2]])
          @map = [[@regions[rl[0]], @regions[rl[1]]],
                  [@regions[rl[2]], @regions[rl[3]]]]
        when 5
          @regions[rl[0]].add_connection(@regions[rl[1]])
          @regions[rl[0]].add_connection(@regions[rl[2]])

          @regions[rl[1]].add_connection(@regions[rl[2]])

          @regions[rl[2]].add_connection(@regions[rl[3]])
          @regions[rl[2]].add_connection(@regions[rl[4]])

          @regions[rl[3]].add_connection(@regions[rl[4]])

          @map = [[@regions[rl[0]], @regions[rl[1]]],
                  [@regions[rl[2]]],
                  [@regions[rl[3]], @regions[rl[4]]]]
        when 6
          @regions[rl[0]].add_connection(@regions[rl[1]])
          @regions[rl[0]].add_connection(@regions[rl[3]])

          @regions[rl[1]].add_connection(@regions[rl[2]])
          @regions[rl[1]].add_connection(@regions[rl[4]])

          @regions[rl[2]].add_connection(@regions[rl[5]])

          @regions[rl[3]].add_connection(@regions[rl[4]])

          @regions[rl[4]].add_connection(@regions[rl[5]])

          @map = [[@regions[rl[0]], @regions[rl[1]], @regions[rl[2]]],
                  [@regions[rl[3]], @regions[rl[4]], @regions[rl[5]]]]
        when 7
          @regions[rl[0]].add_connection(@regions[rl[1]])
          @regions[rl[0]].add_connection(@regions[rl[2]])
          @regions[rl[0]].add_connection(@regions[rl[3]])

          @regions[rl[1]].add_connection(@regions[rl[3]])
          @regions[rl[1]].add_connection(@regions[rl[4]])

          @regions[rl[2]].add_connection(@regions[rl[3]])
          @regions[rl[2]].add_connection(@regions[rl[5]])

          @regions[rl[3]].add_connection(@regions[rl[4]])
          @regions[rl[3]].add_connection(@regions[rl[5]])
          @regions[rl[3]].add_connection(@regions[rl[6]])

          @regions[rl[4]].add_connection(@regions[rl[6]])

          @regions[rl[5]].add_connection(@regions[rl[6]])

          @map = [[@regions[rl[0]], @regions[rl[1]]],
                  [@regions[rl[2]], @regions[rl[3]], @regions[rl[4]]],
                  [@regions[rl[5]], @regions[rl[6]]]]

        when 8
          @regions[rl[0]].add_connection(@regions[rl[1]])
          @regions[rl[0]].add_connection(@regions[rl[3]])

          @regions[rl[1]].add_connection(@regions[rl[2]])
          @regions[rl[3]].add_connection(@regions[rl[4]])

          @regions[rl[2]].add_connection(@regions[rl[4]])

          @regions[rl[3]].add_connection(@regions[rl[4]])
          @regions[rl[3]].add_connection(@regions[rl[6]])

          @regions[rl[4]].add_connection(@regions[rl[6]])
          @regions[rl[4]].add_connection(@regions[rl[7]])

          @regions[rl[6]].add_connection(@regions[rl[7]])

          @regions[rl[7]].add_connection(@regions[rl[8]])

          @map = [[@regions[rl[0]], @regions[rl[1]], @regions[rl[2]]],
                  [@regions[rl[3]], @regions[rl[4]]],
                  [@regions[rl[5]], @regions[rl[6]], @regions[rl[7]]]]

        when 9
          @regions[rl[0]].add_connection(@regions[rl[1]])
          @regions[rl[0]].add_connection(@regions[rl[3]])

          @regions[rl[1]].add_connection(@regions[rl[2]])
          @regions[rl[1]].add_connection(@regions[rl[4]])

          @regions[rl[2]].add_connection(@regions[rl[5]])


          @regions[rl[3]].add_connection(@regions[rl[4]])
          @regions[rl[3]].add_connection(@regions[rl[6]])

          @regions[rl[4]].add_connection(@regions[rl[5]])
          @regions[rl[4]].add_connection(@regions[rl[7]])

          @regions[rl[5]].add_connection(@regions[rl[8]])

          @regions[rl[6]].add_connection(@regions[rl[7]])

          @regions[rl[7]].add_connection(@regions[rl[8]])

          @map = [[@regions[rl[0]], @regions[rl[1]], @regions[rl[2]]],
                  [@regions[rl[3]], @regions[rl[4]], @regions[rl[5]]],
                  [@regions[rl[6]], @regions[rl[7]], @regions[rl[8]]]]

      end
    end

    def region(name)
      @regions[name]
    end

    def random_region
      @regions[@regions.keys.sample]
    end

    def random_block
      random_region.random_block
    end

    def move_to(dest_string)
      dest_region, dest_block = dest_string.split(":")
      @regions[dest_region].block(dest_block.to_i)
    end

    def get_block(my_region)
      my_region, my_block = my_region.split(":")
      region(my_region).block(my_block)
    end
  end
end
