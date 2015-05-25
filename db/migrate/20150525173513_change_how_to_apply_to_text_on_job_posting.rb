class ChangeHowToApplyToTextOnJobPosting < ActiveRecord::Migration
  def change
    change_column :job_postings, :how_to_apply, :text
  end
end
