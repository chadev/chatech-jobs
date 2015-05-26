require 'rails_helper'

describe "Job Creation" do
  describe "Home page links" do
    it "should have a link to job creation" do
      visit root_path
      expect(page).to have_link 'Post a Job'
    end
  end

  describe "creating a new job" do
    let(:title) { 'Some dev job' }
    let(:company) { 'Test Company' }
    let(:description) { 'Description with *markdown*' }
    let(:parsed_description) { 'Description with <em>markdown</em>' }
    let(:how_to_apply) { 'Send us an email' }

    it "should create the job" do
      expect {
        create_new_job
      }.to change { JobPosting.count }.by(1)
    end

    it "populate the new job page" do
      create_new_job

      expect(page).to have_content(title)
      expect(page).to have_content(company)
      expect(page.html).to include(parsed_description)
      expect(page).to have_content(how_to_apply)
    end
  end

  def create_new_job
    visit new_job_path

    fill_in 'Job Title', with: title
    fill_in 'Company Name', with: company
    fill_in 'Job Description', with: description
    fill_in 'How to apply', with: how_to_apply

    click_button 'Submit Job'
  end
end
