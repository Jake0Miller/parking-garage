class Floor < ApplicationRecord
  validates_presence_of :level, :width, :length
  validates_uniqueness_of :level, scope: :structure
  belongs_to :structure
  has_many :rows
end
