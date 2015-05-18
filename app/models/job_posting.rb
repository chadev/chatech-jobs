class JobPosting < ActiveRecord::Base
  def posted_at
    "Posted #{created_at.strftime('%B %-d')}"
  end

  def availability
    full_time? ? "Full Time" : "Part Time / Contract"
  end
end
