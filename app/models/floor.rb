class Floor < ApplicationRecord
  validates_presence_of :level, :width, :length
  validates :level, uniqueness: true
  belongs_to :structure
  has_many :rows
end
