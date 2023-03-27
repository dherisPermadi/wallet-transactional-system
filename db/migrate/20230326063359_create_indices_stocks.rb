class CreateIndicesStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :indices_stocks do |t|
      t.string :name, index: true, unique: true, nil: false

      t.timestamps
    end
  end
end
