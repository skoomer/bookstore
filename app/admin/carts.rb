ActiveAdmin.register Cart do
    permit_params :user, :session_id, :book, :quantity, :status, :active_admin_requested_event
  
    index do
      selectable_column
      id_column
      column :user_id
      column :session_id
      column :book

      column :quantity
      actions
    end

  
   
  show do
    attributes_table do
      row :user_id
      row :book
   
   
    end
    active_admin_comments
  end

  end
  