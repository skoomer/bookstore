ActiveAdmin.register Review do
  config.filters = false


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :text, :score, :status, :user_id, :book_id
  permit_params :status, :active_admin_requested_event
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :text, :score, :status, :user_id, :book_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  after_save do |review|
    event = params[:review][:active_admin_requested_event]
    unless event.blank?
      safe_event = (review.aasm.events(permitted: true).map(&:name) & [event.to_sym]).first
      raise "Forbidden event #{event} requested on instance #{review.id}" unless safe_event

      review.send("#{safe_event}!")
    end
  end

  scope :all, default: true
  scope :waiting
  scope :approved
  scope :rejected

  index do
    selectable_column
    column :book
    column :title
    column :created_at
    column :user
    state_column :status
    actions defaults: false do |status|
      link_to t('admin.change_status'), edit_admin_review_path(status)
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title, input_html: { disabled: true }
      f.input :text, input_html: { disabled: true }

      f.input :active_admin_requested_event, label: t('admin.change_state'), as: :radio, collection:
        f.object.aasm.events(permitted: true).map(&:name)
    end
    f.actions
  end
  
end
