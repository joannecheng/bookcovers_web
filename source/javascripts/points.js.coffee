class Points
  constructor: (numPoints, w=500, h=500) ->
    @points = _.map [1..numPoints], ->
      new Point(Math.random()*w, Math.random()*h)

  lines: =>
    close = []
    _.each @points, (point) =>
      _.each @points, (otherPoint) =>
        if point.dist(otherPoint) < 60
          close.push([point.x, point.y, otherPoint.x, otherPoint.y])
    close

class Point
  constructor: (@x, @y) ->

  dist: (otherPoint) ->
    xs = @x - otherPoint.x
    ys = @y - otherPoint.y

    Math.sqrt((xs*xs) + (ys*ys))

window.Points = Points
window.Point = Point
