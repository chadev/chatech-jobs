require 'rails_helper'

describe "Viewing a list of Job Listings" do
  let!(:job1) { create(:job_posting, title: 'test 1') }
  let!(:job2) { create(:job_posting, title: 'test 2') }

  it "should have a list of jobs" do
    visit root_path
    expect(page).to have_content job1.title
    expect(page).to have_content job2.title
  end
end
