ActiveAdmin.register Author do
  config.filters = false
  decorate_with AuthorDecorator
  #decorate_with AuthorDecorator #добавиться после пула со 2 степа


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column

    column :first_name

    column :last_name

    column :description

    actions
  end

  show title: :full_name do
    attributes_table do
      row :first_name
      row :last_name
      row :created_at
      row :updated_at
    end
  end
  
end
