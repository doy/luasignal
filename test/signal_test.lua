require 'signal'

N = 200000000

print("Running before messing with SIGINT")
for i = 1, N do end
signal.signal("INT", "ignore")
print("Running now with SIGINT ignored...")
for i = 1, N do end
signal.signal("INT", function() print("Got an interrupt!") end)
print("Running now with a custom SIGINT handler...")
for i = 1, N do end
signal.signal("INT", "cdefault")
print("Running now with the default SIGINT handler...")
for i = 1, N do end
signal.signal("INT", "default")
print("Running now with Lua's default SIGINT handler...")
for i = 1, N do end
print("Done!")
