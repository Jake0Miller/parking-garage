class Structure < ApplicationRecord
  validates_presence_of :height, :width, :length,
                        :m_fare, :c_fare, :b_fare,
                        :m_revenue, :c_revenue, :b_revenue
  has_many :floors
end
