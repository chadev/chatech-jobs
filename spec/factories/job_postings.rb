FactoryGirl.define do
  factory :job_posting do
    title "Full Time Rails Developer"
    description "It's a full time job...doing rails"
    how_to_apply "You can apply by sending an email to us"
    company "Some co."
    full_time false
  end
end
