
require 'signal'

signal.signal("INT", function() print("Got an interrupt!") end)
signal.raise("INT")
