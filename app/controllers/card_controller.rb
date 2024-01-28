class CardController < ApplicationController
  def show
    @card = Card.new(units_per_exchange: params[:un_ex].to_i, correction_factor: params[:corr].to_i).to_display(6)
  end
end
