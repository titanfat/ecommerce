module CurrentCard
  private
  def set_card
    @card = Card.find(session[:card_id])
  rescue ActiveRecord::RecordNotFound
    @card = Card.create
    session[:card_id] = @card.id
  end
end