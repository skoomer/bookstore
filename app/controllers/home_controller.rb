class HomeController < ApplicationController
  def index; end

  def home
    render plain: 'Home page'
  end
end
