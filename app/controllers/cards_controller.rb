class CardsController < ApplicationController
  before_action :set_backup, :set_rarities, :set_hps, :set_names

  def index
    @cards ||= @last_backup.cards
  end

  def search
    parameters = search_params
    @cards = Card.search(@last_backup, parameters)
  end

  private

    def set_backup
      @last_backup = Backup.last
    end

    def set_rarities
      @rarities = Rarity.all
    end

    def set_hps
      @hps = @last_backup.cards.order(:hp).pluck(:hp).uniq.reject{|v| v.nil?}
    end

    def set_names
      @names = @last_backup.cards.order(:name).pluck(:name)
    end

    def search_params
      params.require(:search).permit(:rarity_id, :name, :hp)
    end
end
