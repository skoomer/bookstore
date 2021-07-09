# frozen_string_literal: true
# # frozen_string_literal: true

# module Books
#   class CatalogBooks
#     def call(params)
#       sorting = Sortings::SortCurrent.call(sort_selected: params[:sort])
#       scoped = filter_by_category(Book.includes(:author), params[:category_id])
#       sorting(scoped, sorting[:sort_field], sorting[:sort_direction])
#     end

#     private

#     def filter_by_category(scoped, category_id = nil)
#       category_id ? scoped.where(category_id: category_id) : scoped
#     end

#     def sorting(scoped, sort_field = :id, sort_direction = :desc)
#       scoped.order(sort_field => sort_direction)
#     end
#   end
# end
