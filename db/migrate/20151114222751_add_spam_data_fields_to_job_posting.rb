class AddSpamDataFieldsToJobPosting < ActiveRecord::Migration
  def change
    change_table :job_postings do |t|
      t.column :akismet_spam, :boolean, default: false
      t.column :user_ip, :string
      t.column :user_agent, :string
      t.column :referrer, :string
    end
  end
end
