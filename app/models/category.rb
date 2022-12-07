class Category < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, maximum: 25, minimum: 3
end