ActiveAdmin.register Book do
  decorate_with BookDecorator
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :price, :description, :author_id, :category_id, :height, :width, :depth, :material, :quantity, :publication_year
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :price, :description, :author_id, :category_id, :height, :width, :depth, :material, :quantity, :publication_year]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column

    # column :covers do |book|
    #   book.covers.map do |cover|
    #     image_tag url_for(cover.variant(resize: '50x50').processed)
    #   end
    # end

    column :title

    column :authors, &:author_name #  во 2 степе есть автор декоратор так что будет ошибка после пула

    column :description, &:description_short

    column :category

    column :price

    column :image

    actions
  end
end
