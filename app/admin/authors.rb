ActiveAdmin.register Author do
  #decorate_with AuthorDecorator #добавиться после пула со 2 степа

  permit_params :first_name, :last_name


  index do
    selectable_column

    column :first_name

    column :last_name

    column :description

    actions
  end
  
end
