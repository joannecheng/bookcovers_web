w = 500
h = 500
padding = 20
numPoints = 200

$ ->
  canvas = d3.select("svg")
    .attr({ width: w+padding*2, height: h+padding*2})
    .append("g")
    .attr("transform", "translate(#{padding},#{padding})")

  allPoints = new Points(200, w, h)

  dots = canvas
    .append("g")
    .classed("dots", true)
    .selectAll("circle.dot")
    .data(allPoints.points).enter()
    .append("circle")
    .attr(
      fill: "black"
      strokeWeight: 0
      r: -> Math.random() * 3 + 1
      cx: (d) -> d.x
      cy: (d) -> d.y
    )

  lines = canvas
    .append("g")
    .classed("connectors", true)
    .selectAll("line.connection")
    .data(allPoints.lines()).enter()
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
