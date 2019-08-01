class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  # A dose is the amount needed for each ingredient in a cocktail
  # (e.g. the Mojito cocktail needs 6cl of lemon).
  # So each dose references a cocktail,
  # an ingredient and has a description.

  # A dose must have a description,
  # a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique.

  # You can't delete an ingredient if it used by at least one cocktail.
  # When you delete a cocktail,
  # you should delete associated doses
  # (but not the ingredients as they can be linked to other cocktails).
  validates :description, presence: true
  validates_uniqueness_of :cocktail, scope: :ingredient
end
