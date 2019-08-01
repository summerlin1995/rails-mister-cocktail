class Cocktail < ApplicationRecord
# A cocktail has a name (e.g. "Mint Julep", "Whiskey Sour", "Mojito")
# A cocktail must have a unique name.
# A cocktail has many doses
# A cocktail has many ingredients through doses
# You can't delete an ingredient if it used by at least one cocktail.
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
end
