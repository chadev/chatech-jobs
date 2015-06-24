class AddJobPostingIndexes < ActiveRecord::Migration
  def change
    add_index :job_postings, :title
    add_index :job_postings, :company
  end
end
