class AddCompanyToJobPostings < ActiveRecord::Migration
  def change
    add_column :job_postings, :company, :string
  end
end
