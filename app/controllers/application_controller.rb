class ApplicationController < ActionController::Base
    include Pundit
    include Pagy::Backend
    include Pagy::Frontend
end
