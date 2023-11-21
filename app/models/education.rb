class Education < ApplicationRecord

  belongs_to :doctor #have to specify the destroy dependency
  validates :university, presence: true
  validates :degree_name, presence: true
  validates :score, numericality: {greater_than_or_equal_to: 50, less_than_or_equal_to: 100}

end
