class Dose < ApplicationRecord
  validates :description, presence: true
  validates_uniqueness_of :cocktail, scope: :ingredient
  belongs_to :cocktail
  belongs_to :ingredient
end
