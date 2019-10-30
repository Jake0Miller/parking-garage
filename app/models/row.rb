class Row < ApplicationRecord
  validates_presence_of :letter, :length
  validates_uniqueness_of :letter, scope: :floor
  belongs_to :floor
  has_many :spots
end
