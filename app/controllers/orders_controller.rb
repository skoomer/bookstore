class OrdersController < ApplicationController
    def index
        @orders = FilterStatusesQuery.call(current_user, status_params)
      end
    
      private
    
      def status_params
        %w[canceled].include?(params[:status]) ? params[:status] : nil
      end
end
