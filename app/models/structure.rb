class Structure < ApplicationRecord
  validates_presence_of :name, :height, :width, :length,
                        :m_fare, :c_fare, :b_fare,
                        :m_revenue, :c_revenue, :b_revenue
  validates_uniqueness_of :name
  has_many :floors

  def total_revenue
    self.m_revenue + self.c_revenue + self.b_revenue
  end
end
