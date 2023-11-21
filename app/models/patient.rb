class Patient < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :insurance, presence: true, inclusion: { in: %w(Private Public)}
end
