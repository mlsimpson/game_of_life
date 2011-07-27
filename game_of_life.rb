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

    neighbors_array = Array.new

    next_state = @state.clone

    0.upto(@state.length - 1){|row|
      neighbors_array << Array.new(size=@state.length)
    }

    0.upto(@state.length - 1){|row|
      0.upto(@state.length - 1){|col|
        neighbor_count = 0
        for i in (-1..1)
          (row + i > (@state.length - 1)) ? i = (0 - (@state.length - 1)) : nil
          for j in (-1..1)
            (col + j > (@state.length - 1)) ? j = (0 - (@state.length - 1)) : nil
            neighbor_count += @state[row+i][col+j] unless (row+i == row && col+j == col)
          end
        end
        neighbors_array[row][col] = neighbor_count
      }
    }

    0.upto(@state.length - 1){|row|
      0.upto(@state.length - 1){|col|
        if @state[row][col] == 1 # Current state is "Life"
          if neighbors_array[row][col] < 2 || neighbors_array[row][col] > 3
            @state[row][col] = 0
          end
        else # Current state is "Dead"
          if neighbors_array[row][col] == 3
            @state[row][col] = 1
          end
        end
      }
    }

    @state

  end

end
