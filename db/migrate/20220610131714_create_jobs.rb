class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.datetime :published_at
      t.text :description

      t.timestamps
    end
  end
end
