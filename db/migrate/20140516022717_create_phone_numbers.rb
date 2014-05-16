class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.integer :number
      t.string :cellphone
      t.boolean :primary
      t.references :client, index: true

      t.timestamps
    end
  end
end
