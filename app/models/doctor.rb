class Doctor < ApplicationRecord
  has_many :educations, dependent: :destroy
  has_many :appointments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true, inclusion: { in: %w(Prof. Dr.)}
  validates :specialty, presence: true, inclusion: {in: %w(Dermatologist Pneumologist Cardiolgist Dentist GP)}
  validates :experience, presence: true, numericality: {greater_than_or_equal_to: 2, less_than_or_equal_to: 6}

  def create_collection_tag
    "#{self.title} #{self.first_name} #{self.last_name} - #{self.specialty}"
  end
end
