class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews do |t|
      t.references :candidate
      t.references :employee
      t.references :job
      t.string :round
      t.text :other_attributes

      t.timestamps
    end
  end
end
