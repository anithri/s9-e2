module Gotham
  class Block
    attr_accessor :paths, :crime, :streets, :disaster, :hideout, :name

    attr_reader :number, :region, :connector

    COLORS    = [:white, :blue, :green, :yellow, :red]

    #Don't allow for more levels than there are color levels.'
    MAX_LEVEL = COLORS.length - 1

    def initialize(number, region, paths = [],
        crime = 0, streets = 0, disaster = 0, hideout = false)
      @number   = number
      @paths    = paths
      @region   = region
      @crime    = crime
      @streets  = streets
      @disaster = disaster
      @hideout  = hideout
    end

    def to_s
      "#{number}.#{color(@streets)}.#{color(@disaster)}"
    end

    def move_entry(val = @number)
      "#{@region.name}:#{val}"
    end

    def status_string
      "#{move_entry} streets:#{color(@streets)}, disaster:#{color(@disaster)}"
    end

    def add_connection(to)
      @connector = to
    end

    def add_path(to)
      @paths.push(to).uniq!
    end

    def increase_crime(i = 1)
      @crime += i
      @crime = MAX_LEVEL if @crime > MAX_LEVEL
      #puts "#{move_entry}: Gangs got wilder.  Now #{@crime}"
    end

    def increase_streets(i = 1)
      @streets += i
      @streets = MAX_LEVEL if @streets > MAX_LEVEL
      puts "#{move_entry}: Gangs got wilder.  Now #{@streets}"
    end

    def increase_disaster(i = 1)
      @disaster += i
      @disaster = MAX_LEVEL if @disaster > MAX_LEVEL
      puts "#{move_entry}: Disaster got worse.  Now #{@disaster}"
    end

    def decrease_crime(i = 1)
      @crime -= i
      @crime = 0 if @crime < 0
    end

    def decrease_streets(i = 1)
      @streets -= i
      @streets = 0 if @streets < 0

      phrase = @streets > 0 ? "got quieter" : "Are quiet"
      puts "#{move_entry}: Gangs #{phrase}.  Now #{@streets}"
    end

    def decrease_disaster(i = 1)
      @disaster -= i
      @disaster = 0 if @disaster < 0

      phrase = @disaster > 0 ? "quieting down" : "is dealt with here"
      puts "#{move_entry}: Gangs #{phrase}.  Now #{@disaster}"  
    end

    def show_moves
      moves = []
      moves << @connector.move_entry unless @connector.nil?
      moves + @paths.map { |b| move_entry(b) }
    end

    def show_area
      out = "\nCurrently in: #{move_entry}\n"
      out += "  Street Violence: #{@streets}\n"
      out += "  Disaster Level:  #{@disaster}\n"
      out += "Connected areas:"
      show_moves.each do |r|
        out += "  #{self.region.map.get_block(r)}"
      end

      puts @connector.inspect
      out
    end

    def trouble_near_by?(stat)
      out = false
      show_moves.each do |n|
        out ||= @region.map.get_block(n).send(stat) > 0
      end
    end

    def has_streets?
      @streets > 0
    end

    private
    def color(char, level = -1)
      level = char if level < 0
      char.to_s.colorize(COLORS[level])
    end


  end
end
