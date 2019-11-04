class Structure < ApplicationRecord
  validates_presence_of :name, :height, :width, :length,
                        :m_fare, :c_fare, :b_fare,
                        :m_revenue, :c_revenue, :b_revenue
  validates_uniqueness_of :name
  has_many :floors

  after_create :create_floors

  def total_revenue
    self.m_revenue + self.c_revenue + self.b_revenue
  end

  def create_floors
    self.height.times do |i|
      self.floors.create(level: i+1, width: self.width, length: self.length)
    end
  end

  def incr_revenue(type)
    if type == 'm'
      self.m_revenue += self.m_fare
    elsif type == 'c'
      self.c_revenue += self.c_fare
    elsif type == 'b'
      self.b_revenue += self.b_fare
    end
    self.save
  end
end
