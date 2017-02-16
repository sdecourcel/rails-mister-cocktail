class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, presence: true, uniqueness: true
  validates :name, inclusion: { in: ["lemon", "ice", "mint leaves"] }
end
