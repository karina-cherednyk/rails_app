class ReviewsController < ApplicationController

    def create
        @book = Book.find(params[:book_id])
        # @review = @book.reviews.create(review_params)
        @review = Review.new(review_params)
        @review.book_id = params[:book_id]
        @review.user_id = current_user.id
        @review.save
        redirect_to book_path(@book)
      end


    def destroy
        @book = Book.find(params[:book_id])
        @review = @book.reviews.find(params[:id])
        @review.destroy
        redirect_to book_path(@book), status: 303
    end
    
    private
    def review_params
        params.require(:review).permit(:title, :body)
    end

end
