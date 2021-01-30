class CombineItemsInCard < ActiveRecord::Migration[6.1]
  def up
    Card.all.each do |card|
      sums = card.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          card.line_items.where(product_id: product_id).delete_all
          item = card.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save
        end
      end
    end
  end
end
