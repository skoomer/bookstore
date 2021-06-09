ActiveAdmin.register Book do
  decorate_with BookDecorator
  includes :category,  :author

  permit_params :title, :price, :description, :author_id, :category_id, :height, :width, :depth, :material, :quantity, :publication_year

  index do
    selectable_column
    column :title
    column :author
    column :description, &:description_short
    column :category
    column :price
    column :image
    actions
  end

  show do
    attributes_table do
      row :title
      row :author
      row :description
      row :price
      row :publication_year
      row :material
      row :dimensions
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title

      f.input :description, as: :text
      f.input :price
      f.input :publication_year
      f.input :material
      f.input :height
      f.input :width
      f.input :depth
      f.input :category
      f.input :author, as: :check_boxes, collection: Author.all.decorate.map { |author| [author.full_name, author.id] }
    end
    f.actions
  end
end
