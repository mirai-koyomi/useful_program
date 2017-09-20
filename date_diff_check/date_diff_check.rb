require 'date'

d1 = DateTime.now
d2 = DateTime.new(2017, 9,  10,  0,  0,  0, "+09:00")

p "#{(d2.to_time.to_i - d1.to_time.to_i) * 1000 + ((Time.now.usec / 1000.0).round)}ミリ秒"
