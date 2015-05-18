class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.string :title
      t.text :description
      t.string :how_to_apply
      t.boolean :full_time, default: true

      t.timestamps null: false
    end
  end
end
