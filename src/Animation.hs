module Animation where

import Workshop

animation t =     offset (-400)   200  (dogwheel t)
              <@> offset (-400) (-200) (gooseChase t)
              <@> offset  400    200   (dogwheel t)
              <@> offset  0      200   (rotate (-t) cat)
              <@> offset (-300)  0     (text "Welcome to CS141!")

-- A load of dogs spinning around
dogwheel t = foldr (<@>) blank $ fmap spinningDog [ t, t + 45 .. t + 315 ]

-- One single rotating dog
spinningDog t = rotate t (offset 100 0 dog)

-- The bottom of the screen goose chase
gooseChase t = offset (t * 2) 0 (duck <|> duck <|> scale 2 goose)