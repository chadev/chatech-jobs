class JobPosting < ActiveRecord::Base
  attr_accessor :email
  validates :title, presence: true
  validates :company, presence: true
  validates :description, presence: true
  validates :how_to_apply, presence: true

  include Rakismet::Model
  rakismet_attrs comment_type: 'job-post', content: :description,
                 author: :company

  def self.current_jobs
    current_dates = 30.days.ago.beginning_of_day..Date.current.end_of_day
    where(
      created_at: current_dates,
      akismet_spam: false
    ).order(created_at: :desc)
  end

  def posted_at
    "Posted #{created_at.strftime('%B %-d')}"
  end

  def availability
    full_time? ? "Full Time" : "Part Time / Contract"
  end
end
