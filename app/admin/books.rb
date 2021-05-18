# frozen_string_literal: true

ActiveAdmin.register Author do
  config.filters = false
  decorate_with AuthorDecorator

  permit_params :first_name, :last_name

  index do
    selectable_column
    column :first_name
    column :last_name
    column :description
    column :books
    column I18n.t('admin.authors.view') do |author|
      link_to I18n.t('admin.authors.view'), admin_author_path(author)
    end
    column I18n.t('admin.authors.edit') do |author|
      link_to I18n.t('admin.authors.edit'), edit_admin_author_path(author)
    end
    column I18n.t('active_admin.delete') do |author|
      link_to I18n.t('active_admin.delete'), admin_author_path(author),
              method: :delete, data: { confirm: t('admin.authors.confirmations', quantity: author.books.count) }
    end
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
