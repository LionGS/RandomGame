class GameController < ApplicationController
  def start
    @blocks = Array.new {Array.new}
    for i in 0..9
      blocks_row = Array.new
      for j in 0..9
        blocks_row.push(Block.new(i,j,false,0))
      end
      @blocks.push(blocks_row)
    end
    mine_block = (0..99).to_a.sample(20)
    mine_block.each do |mine|
      x = mine/10
      y = mine%10
      @blocks[x][y].mine = true
      for i in -1..1
        for j in -1..1
          if i!=0 || j!=0
            if x+i>=0 && y+j>=0 && x+i<10 && y+j<10
              @blocks[x+i][y+j].number += 1
            end
          end
        end
      end
    end
  end
end


class Block
  attr_accessor :x,:y,:mine,:number
  def initialize(x, y, mine, number)
    @x = x
    @y = y
    @mine = mine
    @number = number
  end
end
