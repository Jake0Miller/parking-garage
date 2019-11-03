class Row < ApplicationRecord
  validates_presence_of :letter, :length
  validates_uniqueness_of :letter, scope: :floor
  belongs_to :floor
  has_many :spots

  after_create :create_spots

  # motorcycle spot has width 2
  # compact spot has width 3
  # large spot has width 4
  def create_spots
    number = 1
    remaining = self.length

    if remaining >= 20
      5.times do |_|
        self.spots.create(number: number, width: 4)
        number += 1
        remaining -= 4
      end
    end
    
    if (remaining-2) % 3 == 0
      self.spots.create(number: number, width: 2)
      number += 1
      remaining -= 2
    end

    if (remaining-4) % 3 == 0
      2.times do |_|
        self.spots.create(number: number, width: 2)
        number += 1
        remaining -= 2
      end
    end

    while remaining > 2
      self.spots.create(number: number, width: 3)
      number += 1
      remaining -= 3
    end
  end
end
