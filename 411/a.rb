#!/usr/bin/env ruby

pwd = STDIN.readline

if pwd.length <= 5 || pwd.downcase == pwd || pwd.upcase == pwd || pwd !~ /\d/
  print "Too weak"
else
  print "Correct"
end