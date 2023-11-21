class Doctor < ApplicationRecord
  has_many :educations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true, inclusion: { in: %w(Prof. Dr.)}
  validates :specialty, presence: true, inclusion: {in: %w(Dermatologist Pneumologist Cardiolgist Dentist GP)}
  validates :experience, presence: true, numericality: {greater_than_or_equal_to: 2, less_than_or_equal_to: 6}
end
