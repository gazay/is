require 'is/area'
require 'is/point'

class Is

  class << self

    def point(point)
      Point.new *point
    end

    def all_points(points)
      pts = points.clone

      pts.define_singleton_method :in?, ->(area) do
        area = Area.new area
        all? { |point| Is.point(point).in? area }
      end

      pts
    end
    alias :points :all_points

    def any_points(points)
      pts = points.clone

      pts.define_singleton_method :in?, ->(area) do
        area = Area.new area
        any? { |point| Is.point(point).in? area }
      end

      pts
    end

    def select(points)
      pts = points.clone

      pts.define_singleton_method :in, ->(area) do
        area = Area.new area
        select { |point| Is.point(point).in? area }
      end

      pts
    end

    def first(points)
      pts = points.clone

      pts.define_singleton_method :in, ->(area) do
        area = Area.new area
        find { |point| Is.point(point).in? area }
      end

      pts
    end

    def point_in_area?(point, area)
      point(point).in? area
    end

    def all_points_in_area?(points, area)
      all_points(points).in?(area)
    end

    def any_points_in_area?(points, area)
      any_points(points).in?(area)
    end

    def select_points_in_area(points, area)
      select(points).in(area)
    end

    def first_point_in_area(points, area)
      first(points).in(area)
    end

  end

end
