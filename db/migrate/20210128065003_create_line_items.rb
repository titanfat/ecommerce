class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :product
      t.belongs_to :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
