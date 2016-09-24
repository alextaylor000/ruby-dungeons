#!/usr/bin/env ruby

WALL = "#"
PATH = " "
STAIR_UP = "<"
STAIR_DOWN = ">"

def generate_dungeon(length)
  length = length.to_i
  border = Array.new(length, WALL)
  board = Array.new
  board << border
  row = Array.new(length)
  row.each_index do |i|
    if [0, length - 1].include?(i)
      row[i] = WALL
    else
      row[i] = PATH
    end
  end
  row[rand(length - 2) + 1] = "<"
  row[rand(length - 2) + 1] = ">"
  board << row
  board << border

  # display
  board.each do |x|
    x.each do |y|
      print y
    end
    puts ""
  end
end

generate_dungeon(ARGV[0])

