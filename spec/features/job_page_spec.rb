require 'rails_helper'

describe "Job Page" do
  let(:job) { create(:job_posting, full_time: true) }

  it "should display content for a job" do
    visit job_path(job)
    expect(page).to have_content job.title
    expect(page).to have_content job.posted_at
    expect(page).to have_content job.description
    expect(page).to have_content job.how_to_apply
    expect(page).to have_content "Full Time"
  end
end
