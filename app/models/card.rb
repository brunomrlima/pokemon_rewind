class Card < ApplicationRecord
  belongs_to :backup
  belongs_to :rarity

  def self.search(backup, params_info)
    if params_info.keys.first.eql?('Rarity')
      rarity = Rarity.find_by(id: params_info.values.first)
      cards = rarity.cards.where(backup: backup)
    else
      col = params_info.keys.first.to_sym
      cards = backup.cards.where("#{col}": params_info.values.first)
    end
    cards
  end
end
