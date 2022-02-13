class Triangle 

  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    kind
  end

  def kind
    side = []
    side << side1
    side << side2
    side << side3
    tri = side.sort
    if tri.any?(&:negative?)
      raise TriangleError
    elsif tri.all?(0)
      raise TriangleError
    elsif tri[2] >= tri[0] + tri[1]
      raise TriangleError 
    elsif tri.uniq.length == 1
      :equilateral
    elsif tri.uniq.length == 2
      :isosceles
    elsif tri.uniq.length == 3
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
