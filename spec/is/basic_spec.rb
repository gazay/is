require 'is'

describe Is do

  AREA  = \
    [
      [1, 1],
      [3, 1],
      [3, 3],
      [1, 3]
    ]

  describe '#point' do

    it 'is inside area' do
      point = [2, 2]
      Is.point(point).in?(AREA).should be_true
    end

    it "isn't inside area" do
      point = [0, 2]
      Is.point(point).in?(AREA).should_not be_true
    end

  end

  describe '#all_points' do

    it 'are inside area' do
      points = [[2, 2], [2, 2.5]]
      Is.all_points(points).in?(AREA).should be_true
    end

    it "aren't inside area" do
      points = [[0, 2], [0, 1]]
      Is.all_points(points).in?(AREA).should_not be_true
    end

  end

  describe '#any_points' do

    it 'are inside area' do
      points = [[2, 0], [2, 2.5]]
      Is.any_points(points).in?(AREA).should be_true
    end

    it "aren't inside area" do
      points = [[0, 2], [0, 1]]
      Is.any_points(points).in?(AREA).should_not be_true
    end

  end

  describe '#point_in_area?' do

    it 'is inside area' do
      point = [2, 2]
      Is.point_in_area?(point, AREA).should be_true
    end

    it "isn't inside area" do
      point = [0, 2]
      Is.point_in_area?(point, AREA).should_not be_true
    end

  end

  describe '#all_points_in_area?' do

    it 'are inside area' do
      points = [[2, 2], [2, 2.5]]
      Is.all_points_in_area?(points, AREA).should be_true
    end

    it "aren't inside area" do
      points = [[0, 2], [0, 1]]
      Is.all_points_in_area?(points, AREA).should_not be_true
    end

  end

  describe '#any_points_in_area?' do

    it 'are inside area' do
      points = [[2, 0], [2, 2.5]]
      Is.any_points_in_area?(points, AREA).should be_true
    end

    it "aren't inside area" do
      points = [[0, 2], [0, 1]]
      Is.any_points_in_area?(points, AREA).should_not be_true
    end

  end

end
