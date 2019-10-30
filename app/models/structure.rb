class Structure < ApplicationRecord
  validates_presence_of :height, :width, :length,
                        :m_fare, :c_fare, :b_fare
  has_many :floors
end
