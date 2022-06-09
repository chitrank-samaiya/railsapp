class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :type
      t.string :name
      t.string :email, null: false, index: {unique: true}
      t.text :other_attributes

      t.timestamps
    end
  end
end
