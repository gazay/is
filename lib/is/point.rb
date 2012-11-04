class Is
  class Point

    attr_reader :longitude, :latitude

    def initialize(lat, long)
      @latitude = lat.to_f
      @longitude = long.to_f
    end

    def in?(area)
      area = Is::Area.new(area) unless area.is_a?(Is::Area) # :)
      area.contains? self
    end

  end
end
