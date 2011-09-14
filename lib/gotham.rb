require 'colorize'
require 'pathname'
require_relative 'gotham/version.rb'
require_relative 'gotham/game'
require_relative 'gotham/map.rb'
require_relative 'gotham/player_list.rb'
require_relative 'gotham/cards'

module Gotham

  def self.version
    Gotham::VERSION
  end

  def self.base_regions
    #[["Downtown", "GCPD"],
    # ["Arkham Asylum", "Secret Cave"]]
    ["Downtown","Arkham Asylum"]
  end
end
