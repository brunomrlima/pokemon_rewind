class Backup < ApplicationRecord
  has_many :cards, dependent: :destroy
  after_create :populate_cards

  def self.perform_backup
    uri = URI('https://api.pokemontcg.io/v1/cards?setCode=base4')
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    Backup.create(raw_json: response)
  end

  private

  def populate_cards
    json = self.raw_json
    json.values[0].each do |card|
      card['text'] ? text = card['text'].first : text = card['text']
      rarity = Rarity.find_or_create_by!(name: card['rarity'])
      Card.find_or_create_by!(backup: self,
                              rarity: rarity,
                              name: card['name'],
                              image_url: card['imageUrl'],
                              image_url_hires: card['imageUrlHiRes'],
                              description: text,
                              national_pokedex_number: card['nationalPokedexNumber'],
                              evolves_from: card['evolvesFrom'],
                              hp: card['hp'])
    end
  end
end
