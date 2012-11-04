class Is
  class Area

    attr_reader :area

    def initialize(points)
      @area = points.map { |it| Is::Point.new *it }
    end

    def contains?(point)
      point = Is::Point.new(*point) unless point.is_a?(Is::Point)
      return false if outside_box? point

      contains_point = false
      area_size = area.size
      i = -1
      j = area_size - 1

      while (i += 1) < area_size
        vertex1, vertex2 = area.values_at i, j
        if conditions_passed?(point, vertex1, vertex2)
          contains_point = !contains_point
        end
        j = i
      end

      contains_point
    end

    private

    def conditions_passed?(*args)
      orig_lat_between_vertices_lats?(*args.map(&:latitude)) and ray_crosses_segment?(*args)
    end

    def orig_lat_between_vertices_lats?(orig_lat, vertex1_lat, vertex2_lat)
      (vertex1_lat..vertex2_lat).include?(orig_lat) or
      (vertex2_lat..vertex1_lat).include?(orig_lat)
    end

    def ray_crosses_segment?(orig, vertex1, vertex2)
      olt  = orig.latitude
      olg  = orig.longitude
      v1lt = vertex1.latitude
      v1lg = vertex1.longitude
      v2lt = vertex2.latitude
      v2lg = vertex2.longitude

      olg < (v2lg - v1lg) * (olt - v1lt) / (v2lt - v1lt) + v1lg
    end

    def bounding_box
      {
        'left' => area.min{|a, b| a.longitude <=> b.longitude}.longitude,
        'right' => area.max{|a, b| a.longitude <=> b.longitude}.longitude,
        'top' => area.max{|a, b| a.latitude <=> b.latitude}.latitude,
        'bottom' => area.min{|a, b| a.latitude <=> b.latitude}.latitude
      }
    end

    def outside_box?(point)
      if point.nil? || point.longitude.nil? || point.latitude.nil?
        true
      else
        box = bounding_box
        point.longitude < box['left']   ||
        point.longitude > box['right']  ||
        point.latitude  < box['bottom'] ||
        point.latitude  > box['top']
      end
    end

  end
end
