class CreateSkillRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_ratings do |t|
      t.references :skill
      t.integer :rating

      t.timestamps
    end
  end
end
