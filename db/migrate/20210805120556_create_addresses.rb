class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :tel,            null: false
      t.references :order,       null: false
      t.timestamps
    end
  end
end
