ActiveAdmin.register JobPosting do
  permit_params(
    :title,
    :description,
    :how_to_apply,
    :full_time,
    :company,
    :akismet_spam,
    :user_ip,
    :user_agent,
    :referrer
  )

  index do
    id_column
    column :company
    column :full_time
    column :title
    column :description
    column :created_at
    column 'Is spam?', :akismet_spam
    actions
  end

  member_action :spam, method: :put do
    resource.akismet_spam = true
    resource.save
    resource.spam!
    redirect_to resource_path, notice: 'Successfully marked as spam!'
  end

  member_action :ham, method: :put do
    resource.akismet_spam = false
    resource.save
    resource.ham!
    redirect_to resource_path, notice: 'Successfully reported false positive!'
  end

  action_item :view, only: :show do
    link_to 'Submit Spam', spam_admin_job_posting_path, method: :put, title: "Report missed spam:\nThis job posting was not flagged as spam, but should have been."
  end

  action_item :view, only: :show do
    link_to 'Submit Ham', ham_admin_job_posting_path, method: :put, title: "Report false positive:\nThis job posting was flagged as spam, but should not have been."
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
end
