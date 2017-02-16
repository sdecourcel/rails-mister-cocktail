class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  # validates :cocktail, uniqueness: { scope: :ingredient }
  validates_uniqueness_of :ingredient, scope:  :cocktail
end
