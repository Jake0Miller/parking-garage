class Row < ApplicationRecord
  validates_presence_of :letter, :length
  validates :letter, uniqueness: { scope: :floor }
  belongs_to :floor
  has_many :spots
end
