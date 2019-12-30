# require 'pry'
# class Triangle
#   def initialize(side_1, side_2, side_3)
#     # @triangle_sides = []
#     @side_1 = side_1
#     @side_2 = side_2
#     @side_3 = side_3
#     # @triangle_sides << side_1
#     # @triangle_sides << side_2
#     # @triangle_sides << side_3
#   end
#
#   def valid?
#     sum_one_two = @triangle_sides[0] + @triangle_sides[1]
#     sum_one_three = @triangle_sides[0] + @triangle_sides[2]
#     sum_two_three = @triangle_sides[1] + @triangle_sides[2]
#
#     if (@triangle_sides.none? {|side| side <= 0}) &&
#       (sum_one_two > @triangle_sides[2] && sum_one_three > @triangle_sides[1] && sum_two_three > @triangle_sides[0])
#       return true
#     else
#       return false
#     end
#   end
#
#   def kind
#     if valid?
#       if @triangle_sides.uniq.length == 1
#         return :equilateral
#       elsif @triangle_sides.uniq.length == 2
#         return :isosceles
#       else
#         return :scalene
#       end
#     else
#       raise TriangleError
#     end
#   end
# end
#
# class TriangleError < StandardError
#
# end

class Triangle
  def initialize(side_1,side_2,side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind()
    if (@side_1 <= 0) || (@side_2 <= 0) || (@side_3 <= 0)
      raise RangeError
    elsif (@side_1+@side_2 <= @side_3) || (@side_1+@side_3 <= @side_2) || (@side_2+@side_3 <= @side_1)
      raise RangeError
    else
      if (@side_1 == @side_2) && (@side_2 == @side_3)
        :equilateral
      elsif (@side_1 == @side_2) && (@side_2 == @side_3) && (@side_1 == @side_3)
        :isosceles
      elsif (@side_1 != @side_2) && (@side_2 != @side_3) && (@side_1 != @side_3)
        :scalene
      end
    end

  end

end

class RangeError < StandardError

end
