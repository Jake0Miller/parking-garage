class Floor < ApplicationRecord
  validates_presence_of :level, :width, :length
  validates_uniqueness_of :level, scope: :structure
  belongs_to :structure
  has_many :rows

  after_create :create_rows

  def create_rows
    self.width.times do |i|
      self.rows.create(letter: (i+64).chr, length: self.length)
    end
  end
end
