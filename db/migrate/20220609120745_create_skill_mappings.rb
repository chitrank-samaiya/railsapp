class CreateSkillMappings < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_mappings do |t|
      t.references :user
      t.references :skill

      t.timestamps
    end
  end
end
