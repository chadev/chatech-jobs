require 'rails_helper'

RSpec.describe JobPosting, type: :model do

  it { should validate_presence_of :title }
  it { should validate_presence_of :company }
  it { should validate_presence_of :description }
  it { should validate_presence_of :how_to_apply }

  describe ".current_jobs" do
    it "should only return jobs created in the last 30 days" do
      old_job = create(:job_posting, created_at: Date.current - 31.days)
      new_job = create(:job_posting)
      expect(JobPosting.current_jobs).to eq [new_job]
    end

    it "should be ordered by most recent" do
      new_job = create(:job_posting, created_at: Date.current - 10.days)
      newer_job = create(:job_posting, created_at: Date.current)
      expect(JobPosting.current_jobs).to eq [newer_job, new_job]
    end
  end

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
