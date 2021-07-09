# frozen_string_literal: true

ActiveAdmin.register Book do
  decorate_with BookDecorator
  includes :category, :author

  permit_params :title, :price, :description, :author_id, :category_id, :height, :width, :depth, :material, :quantity,
                :publication_year, :cover, images: []

  index do
    selectable_column
    column :title
    column :author
    column :description, &:description_short
    column :category
    column :price
    column :cover do |book|
      image_tag book.cover, style: 'width: 100px' if book.cover.attached?
    end
    column :images do |book|
      book.images.map do |cover|
        image_tag url_for(cover.variant(resize: '50x50').processed)
      end
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :author
      row :category
      row :description
      row :cover
      row :images
      row :price
      row :publication_year
      row :material
      row :height
      row :width
      row :depth
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title
      f.input :author, collection: Hash[Author.all.map { |author| [author.decorate.full_name, author.id] }]
      f.input :description, as: :text
      f.input :price
      f.input :publication_year
      f.input :material
      f.input :height
      f.input :width
      f.input :depth
      f.input :category
      f.input :cover, as: :file
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
end
