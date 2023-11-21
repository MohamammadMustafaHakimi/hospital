class Patient < ApplicationRecord
  belongs_to :doctor
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :insurance, presence: true, inclusion: { in: %w(Private Public)}
  validates :score, numericality: { greater_than_or_equal_to: 50, less_than_or_equal_to: 100 }
end
