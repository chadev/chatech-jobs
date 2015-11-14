ActiveAdmin.register JobPosting do
  permit_params(
    :title,
    :description,
    :how_to_apply,
    :full_time,
    :company
  )

  member_action :spam, method: :put do
    resource.spam!
    redirect_to resource_path, notice: 'Marked as spam!'
  end

  member_action :ham, method: :put do
    resource.ham!
    redirect_to resource_path, notice: 'Marked as ham!'
  end

  action_item :view, only: :show do
    link_to 'Mark Spam', spam_admin_job_posting_path, method: :put
  end

  action_item :view, only: :show do
    link_to 'Mark Ham', ham_admin_job_posting_path, method: :put
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
