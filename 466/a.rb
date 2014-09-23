#!/usr/bin/env ruby

trips, ab_trips, one_trip_cost, ab_cost = STDIN.read.split(' ').map &:to_i

print [ 
  trips * one_trip_cost,
  trips/ab_trips * ab_cost + trips % ab_trips * one_trip_cost, 
  trips/ab_trips * ab_cost + ab_cost
].min
