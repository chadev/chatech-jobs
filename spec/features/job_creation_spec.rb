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

    context "with invalid information" do
      let(:title) { '' }

      it "should not create a listing" do
        expect {
          submit_new_job_form
        }.to_not change { JobPosting.count }
      end

      it "should display errors" do
        submit_new_job_form

        expect(page).to have_selector('.alert-error')
        expect(page).to have_selector('.field_with_errors')
      end
    end

    context "with valid information" do
      it "should create the job" do
        expect {
          submit_new_job_form
        }.to change { JobPosting.count }.by(1)
      end

      it "populate the new job page" do
        submit_new_job_form

        expect(page).to have_content(title)
        expect(page).to have_content(company)
        expect(page.html).to include(parsed_description)
        expect(page).to have_content(how_to_apply)
      end
    end
  end

  def submit_new_job_form
    visit new_job_path

    fill_in 'Job Title', with: title
    fill_in 'Company Name', with: company
    fill_in 'Job Description', with: description
    fill_in 'How to apply', with: how_to_apply

    click_button 'Submit Job'
  end
end
