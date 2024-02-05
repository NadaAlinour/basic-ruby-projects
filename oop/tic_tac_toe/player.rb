# frozen_string_literal: true

class Player
  attr_accessor :marker, :latest_move, :turn

  def initialize
    @latest_move = []
  end

  def make_move(coordinate_a, coordinate_b)
    @latest_move[0] = coordinate_a
    @latest_move[1] = coordinate_b
  end
end
