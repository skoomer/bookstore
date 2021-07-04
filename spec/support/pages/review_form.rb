# frozen_string_literal: true

class ReviewForm < SitePrism::Section
  element :title_field, 'input#review_title'
  element :radio_button, 'input#review_score_2'
  element :text_field, 'input#review_text'
  element :post_button, 'input#post_review'

  def review_as_book(title: '', text: '', score: 2)
    title_field.set title
    text_field.set text
    radio_button.click score
    post_button.click
  end
end
