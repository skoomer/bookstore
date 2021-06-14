# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    review = book.reviews.build(review_params.merge(user_id: current_user.id))

    review.save ? flash_success : flash[:error] = review.errors.full_messages.join(', ')

    redirect_back(fallback_location: root_path)
  end

  def flash_success
    flash[:success] = t('book_pages.review')
  end

  def review_params
    params.require(:review).permit(:title, :text, :score)
  end

  def book
    Book.find(params[:book_id])
  end
end
