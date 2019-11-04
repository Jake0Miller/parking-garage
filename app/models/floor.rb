class Floor < ApplicationRecord
  validates_presence_of :level, :width, :length
  validates_uniqueness_of :level, scope: :structure
  belongs_to :structure
  has_many :rows
  has_many :spots, through: :rows

  after_create :create_rows

  def create_rows
    self.width.times do |i|
      self.rows.create(letter: (i+65).chr, length: self.length)
    end
  end

  def find_bus_parking
    b_spot = self.spots.find_all {|spot| spot.vehicle_id.nil? && spot.width == 4}
    b_spot = b_spot.group_by {|spot| spot.row_id}
    b_spot.find {|key,val| val.length == 5}
  end
end
