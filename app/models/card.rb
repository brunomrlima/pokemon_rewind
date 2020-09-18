class Card < ApplicationRecord
  belongs_to :backup
  belongs_to :rarity
end
