class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.references :identifier_stock
      t.references :stockable, polymorphic: true
      t.integer :quantity, default: 0
      t.decimal :unit_price, precision: 10, scale: 2
      t.decimal :total_price, precision: 20, scale: 2

      t.timestamps
    end
  end
end
