class Floor < ApplicationRecord
  validates_presence_of :level, :width, :length
  belongs_to :structure
  has_many :rows
end
