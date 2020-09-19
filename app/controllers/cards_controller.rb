class CardsController < ApplicationController
  before_action :set_rarities, :set_hps, :set_names

  def index
    last_backup = Backup.last
    @cards ||= last_backup.cards
  end

  def search
    parameters = search_params
    @cards = Card.search(parameters)
  end

  private

  def set_rarities
    @rarities = Rarity.all
  end

  def set_hps
    @hps = Card.pluck(:hp).uniq.reject{|v| v.nil?}
  end

  def set_names
    @names = Card.order(:name).pluck(:name)
  end

  def search_params
    params.require(:search).permit(:rarity_id, :name, :hp)
  end
end
