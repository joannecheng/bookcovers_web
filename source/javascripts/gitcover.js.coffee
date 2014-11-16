w = 500
h = 500
canvas = d3.select("svg")
  .attr({ width: w, height: h })
  .append("g")
numPoints = 200
maxDist = 60
points = _.map [1..numPoints], ->
  [Math.random()*w, Math.random()*h]

dist = (point1, point2) ->
  xs = point1[0] - point2[0]
  ys = point1[1] - point2[1]

  Math.sqrt((xs*xs) + (ys*ys))

closePoints = ->
  close = []
  _.each points, (point) ->
    _.each points, (otherPoint) ->
      if dist(point, otherPoint) < maxDist
        close.push([point[0], point[1], otherPoint[0], otherPoint[1]])
  close

dots = canvas
  .append("g")
  .classed("dots", true)
  .selectAll("circle.dot")
  .data(points)
  .enter()
  .append("circle")
  .attr(
    fill: "black"
    strokeWeight: 0
    r: -> Math.random() * 3 + 1
    cx: (d) -> d[0]
    cy: (d) -> d[1]
  )

lines = canvas
  .append("g")
  .classed("connectors", true)
  .selectAll("line.connection")
  .data(closePoints())
  .enter()
  .append("line")
  .attr(
    opacity: 0.15
    stroke: "#000"
    strokeWeight: 1
    x1: (d) -> d[0]
    y1: (d) -> d[1]
    x2: (d) -> d[2]
    y2: (d) -> d[3]
  )
