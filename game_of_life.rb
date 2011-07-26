class GameOfLife

  attr_accessor :state

  def initialize(default_size=3)
    dimensions = default_size
    @state = Array.new

    srand
    0.upto(dimensions - 1){|row|
      @state << (0..dimensions - 1).inject([]){|array, col|
        array << rand(2)
      }
    }
  end

  # This returns an array of arrays
  # AKA:  it returns the game state
  def evolve

    0.upto(@state.length - 1){|row|

      0.upto(@state.length - 1){|col|

        neighbor_count = 0

        system("clear")
        @state.each{|srow|
          p srow
        }

        puts

        p "@state[#{row}][#{col}] = #{@state[row][col]}"
        p "------"

        for i in (-1..1)

          (row + i > (@state.length - 1)) ? i = (0 - (@state.length - 1)) : nil

          for j in (-1..1)

            (col + j > (@state.length - 1)) ? j = (0 - (@state.length - 1)) : nil

            neighbor_count += @state[row+i][col+j] unless (row+i == row && col+j == col)
            p "@state[#{row+i}][#{col+j}] = #{@state[row+i][col+j]}" unless (row+i == row && col+j == col)
          end
          puts
        end
        p "neighbor_count = #{neighbor_count}"
        gets
      }
    }

    rownum = 0
    @state.map{|row|

      row.map{|col|

        neighbor_count = 0

        system("clear")
        @state.each{|srow|
          p srow
        }

        puts

        p "@state[#{row}][#{col}] = #{@state[row][col]}"
        p "------"

        for i in (-1..1)

          (row + i > (@state.length - 1)) ? i = (0 - (@state.length - 1)) : nil

          for j in (-1..1)

            (col + j > (@state.length - 1)) ? j = (0 - (@state.length - 1)) : nil

            neighbor_count += @state[row+i][col+j] unless (row+i == row && col+j == col)
            p "@state[#{row+i}][#{col+j}] = #{@state[row+i][col+j]}" unless (row+i == row && col+j == col)
          end
          puts
        end
        p "neighbor_count = #{neighbor_count}"
        gets
      }
      rownum += 1
    }

    # @state
  end

end

game = GameOfLife.new(4)

game.evolve
