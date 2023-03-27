class CreateIdentifierStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :identifier_stocks do |t|
      t.string :symbol_name, index: true, unique: true, nil: false
      t.string :name, index: true, unique: true, nil: false

      t.timestamps
    end
  end
end
