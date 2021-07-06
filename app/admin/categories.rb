ActiveAdmin.register Category do
  permit_params :title
  config.filters = false

  index do
    selectable_column
    column :title
    # column I18n.t('active_admin.delete') do |category|
    #   link_to I18n.t('active_admin.delete'), admin_category_path(category),
    #           method: :delete, data: { confirm: t('admin.categories.confirmations', quantity: category.books.count) }
    # end
    actions
  end
  
end

