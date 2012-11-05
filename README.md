# Simple tool to find points in polygon

### Build Status ![http://travis-ci.org/gazay/is](https://secure.travis-ci.org/gazay/is.png)

Sponsored by Evil Martians <http://evilmartians.com>

``` ruby
pt =      [2, 2]
all_pts = [[2, 2], [2, 2.5]]
any_pts = [[2, 0], [2, 2]]
no_pts =  [[0, 0], [1, 0]]
area  = \
  [
    [1, 1],
    [3, 1],
    [3, 3],
    [1, 3]
  ]

  ^
3 |  _______
  | |       |
2 | |       |
  | |       |
1 | |_______|
  |_____________>
0   1   2   3

Is.point(pt).in?(area)           # => true
Is.all_points(all_pts).in?(area) # => true
Is.any_points(any_pts).in?(area) # => true
Is.any_points(no_pts).in?(area)  # => false
Is.select(any_pts).in(area)      # => [[2, 2]]
Is.first(any_pts).in(area)       # => [[2, 2]]

# or
Is.point_in_area?(pt, area)           # => true
Is.all_points_in_area?(all_pts, area) # => true
Is.any_points_in_area?(any_pts, area) # => true
Is.any_points_in_area?(no_pts, area)  # => false
```

## License

The MIT License

Copyright (c) 2011-2012 gazay

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
