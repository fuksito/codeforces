#!/usr/bin/env ruby

# n - cores
# m - ticks
# k - shared cache memory

input = STDIN.read.split("\n")
n, m, k = *input[0].split(' ').map(&:to_i)
commands = input[1..-1].map{|s| s.split(' ').map(&:to_i) }

cores = Array.new n, 0
blocked_cells = []

define_method(:working_cores) do
  cores.map.with_index{|c,i| c == 0 ? i : nil }.compact
end

1.upto(m).each do |tick|
  working_cores.
    map { |core| commands[core][tick - 1] }.
    compact.
    group_by(&:to_i).
    select{|_,xs| xs.count > 1 }.
    keys.
    reject{|c| c == 0 }.
    reject{|c| blocked_cells.include?(c) }.
    each { |cell| blocked_cells += [cell] } 

    cores.map.with_index do |s,i|
      next if s > 0
      cores[i] = tick if blocked_cells.include?(commands[i][tick - 1])
    end
end

cores.each do |core|
  puts core
end