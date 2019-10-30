class Structure < ApplicationRecord
  validates_presence_of :height, :width, :length
  has_many :floors
end
