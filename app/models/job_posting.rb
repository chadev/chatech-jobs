class JobPosting < ActiveRecord::Base
  validates :title, presence: true
  validates :company, presence: true
  validates :description, presence: true
  validates :how_to_apply, presence: true

  def self.current_jobs
    current_dates = 90.days.ago..Date.current.end_of_day
    where(created_at: current_dates).order(created_at: :desc)
  end

  def posted_at
    "Posted #{created_at.strftime('%B %-d')}"
  end

  def availability
    full_time? ? "Full Time" : "Part Time / Contract"
  end
end
