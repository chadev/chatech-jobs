namespace :spam do
  desc 'Deletes all job postings which have been marked as spam.'
  task cleanup: :environment do
     JobPosting.where(akismet_spam: true).destroy_all
  end
end
