class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :sourceable, polymorphic: true
      t.references :targetable, polymorphic: true
      t.integer    :transaction_type, null: false, default: 0
      t.decimal    :amount, precision: 20, scale: 2

      t.timestamps
    end
    add_index :transactions, [:sourceable_id, :sourceable_type]
    add_index :transactions, [:targetable_id, :targetable_type]
  end
end
