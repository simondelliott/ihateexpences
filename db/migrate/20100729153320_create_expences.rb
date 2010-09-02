class CreateExpences < ActiveRecord::Migration
  def self.up
    create_table :expences do |t|
      t.string :category
      t.text :body
      t.string :currency
      t.decimal :amount
      t.text :tag
      t.decimal :longditude
      t.decimal :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :expences
  end
end
