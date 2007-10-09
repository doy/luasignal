-- from lhf's lalarm lib
require 'signal'

function myalarm()
    print("in alarm!", os.date("%T"), a, math.floor(100 * a / N) .. "%")
    signal.alarm(1)
end

N = 40000000

print("hello")
signal.signal('ALRM', myalarm)
signal.alarm(1)

a = 0
for i = 1, N do
    a = a + 1
    math.sin(a)	-- waste some time...
end
print(a)
print("bye")
