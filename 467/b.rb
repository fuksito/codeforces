#!/usr/bin/env ruby

input = STDIN.read.split("\n")
n, m, k = *input[0].split(' ').map(&:to_i)
players = input[1..m].map(&:to_i)
fedya = input[m + 1].to_i

print players[0..m].count { |p| (p ^ fedya).to_s(2).chars.map(&:to_i).inject(:+) <= k }