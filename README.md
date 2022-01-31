```
----
# rbr
-- a room builder for the upcoming mia roguelike
# Algorithm
-- rbr uses a drunkard walk style algorithm for its generation atm
-- it should be noted that this algorithm is extremely slow in it's current form
-- in the future i may attempt new algorithms but this works for now
--- http://pcg.wikidot.com/pcg-algorithm:drunkard-walk
# caveats
-- generating a ""unique"" room requires some access to a PRNG (pseudorandom number generator)
-- building a pure software one would likely be a painful task in pure sh
-- as such this project uses `/dev/urandom` and some self made logic along with an edited LCG algorithm
-- to generate random numbers (see psh-prng)
# exit codes
-- 10: generic rgrid errors
-- 12: typelist errors
--- 13: empty $2 in listr()
# notes
-- a nerdfonts compatible font should be used
-- please clone with `--recursive` as this project depends on the submods to operate
```
