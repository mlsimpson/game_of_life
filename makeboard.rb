#!/usr/bin/env ruby

require 'timing_method'

timing_method do

  dimensions = 5

  board = Array.new

  srand
  0.upto(dimensions - 1){|row|
    board << (0..dimensions - 1).inject([]){|array, val|
      array << rand(2)
    }
  }

  p board

  p board.flatten

  p board.flatten[-1]

end
