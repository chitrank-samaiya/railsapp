class CreateInterviewSkillRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :interview_skill_ratings do |t|
      t.references :interview
      t.references :skill_rating

      t.timestamps
    end
  end
end
