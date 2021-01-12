module Api
  module V1
    class BooksController < ApiController

      def index
        books = Book.all

        render json: books, status: :ok
      end

    end
  end
end
