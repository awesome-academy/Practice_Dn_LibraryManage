# frozen_string_literal: true

module BooksHelper
  def get_quantity(book_id)
    return Book.find_by(id: book_id)&.quantity
  end
end
