class Points
  constructor: (numPoints, @w=500, @h=500) ->
    @points = [new Point(@w/2, @h/2)]
    _.each [1..numPoints], =>
      @points.push(@bestPoint())

  lines: =>
    close = []
    _.each @points, (point) =>
      _.each @points, (otherPoint) =>
        if point.dist(otherPoint) < 60
          close.push([point.x, point.y, otherPoint.x, otherPoint.y])
    close

  bestPoint: =>
    numCandidates = 10
    bestCandidate = {}
    bestDistance = 0
    _.each [0..numCandidates], =>
      samplePt = new Point(Math.random()*@w, Math.random()*@h)
      d = samplePt.dist(@_findClosest(samplePt))
      if d > bestDistance
        bestDistance = d
        bestCandidate = samplePt
    bestCandidate

  _findClosest: (samplePoint) =>
    minPoint = samplePoint
    minDist = 999999
    _.each(@points, (point) =>
      if point.dist(samplePoint) < minDist
        minDist = point.dist(samplePoint)
        minPoint = point
    )
    minPoint

class Point
  constructor: (@x, @y) ->

  dist: (otherPoint) ->
    xs = @x - otherPoint.x
    ys = @y - otherPoint.y

    Math.sqrt((xs*xs) + (ys*ys))

window.Points = Points
window.Point = Point
