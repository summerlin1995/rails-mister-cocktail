class Ingredient < ApplicationRecord
  # An ingredient has a name (e.g. "lemon", "ice", "mint leaves")
  # An ingredient must have a unique name.
  # An ingredient has many doses
  # You can't delete an ingredient if it used by at least one cocktail.
  has_many :doses
  validates :name, presence: true, uniqueness: true
end
