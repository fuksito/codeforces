#!/usr/bin/env ruby

input = STDIN.read.split("\n")
rooms = input[1..-1]

print rooms.count { |r|
  r.split(' ').map(&:to_i).reverse.inject(:-) >= 2
}