ActiveAdmin.register Book do
  decorate_with BookDecorator
  includes :category,  :author

  permit_params :title, :price, :description, :author_id, :category_id, :height, :width, :depth, :material, :quantity, :publication_year

  index do
    selectable_column

    column :title

    # column :author, &:full_name #  во 2 степе есть автор декоратор так что будет ошибка после пула
    column t('.authors'), :authors_show
    column :description, &:description_short

    column :category

    # column :price
    column t('.price'), :price_show


    column :image

    actions
  end

  show do
    attributes_table do
      row :name
      row :authors_show
      row :description
      row 'Price' do
        :price_show
      end
      row :year_of_publication
      row :materials_show
      row :dimensions_show
    end
  end
end
