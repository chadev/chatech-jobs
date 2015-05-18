require 'rails_helper'

RSpec.describe JobPosting, type: :model do
  describe "#posted_at" do
    it "should return a string of when the job was posted" do
      job = create(:job_posting, :created_at => Date.new(2015, 5, 13))
      expect(job.posted_at).to eq "Posted May 13"
    end
  end

  describe "#availability" do
    it "should return a part time string if not full time" do
      job = create(:job_posting, :full_time => false)
      expect(job.availability).to eq "Part Time / Contract"
    end

    it "should return a full time string if not full time" do
      job = create(:job_posting, :full_time => true)
      expect(job.availability).to eq "Full Time"
    end
  end
end
