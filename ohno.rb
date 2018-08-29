require 'securerandom'

TOP = 10000
RUNS = 10000

def integer!
  ::SecureRandom.random_number(TOP)
end

ids = {}
previous = integer!
for i in 1..RUNS do
  key = integer!
  if key == previous
    if ids.key?(key)
      ids[key] = ids[key] + 1
    else
      ids[key] = 1
    end
  end
  previous = key
end

collisions = 0
ids.each do | key, count |
  # puts 'integer: %d collisions: %d' % [key, count]
  collisions += count
end

puts 'total collisions: %d runs: %d rate: %f' % [collisions, RUNS, collisions.to_f / RUNS * 100]
