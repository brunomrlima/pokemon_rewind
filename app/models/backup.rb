class Backup < ApplicationRecord
  def self.perform_backup
    uri = URI('https://api.pokemontcg.io/v1/cards?setCode=base4')
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    Backup.create(raw_json: response)
  end
end
