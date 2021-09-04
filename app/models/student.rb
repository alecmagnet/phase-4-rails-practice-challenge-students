class Student < ApplicationRecord
  validates_presence_of :name
  validates :age, numericality: {greater_than_or_equal_to: 18}
  validates :instructor_id, presence: true

  belongs_to :instructor
end
