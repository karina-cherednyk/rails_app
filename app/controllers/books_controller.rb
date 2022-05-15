class BooksController < ApplicationController
    def index
      @books = Book.all
    end
    def show 
      @book = Book.find(params[:id])
    end 
  
    def new 
      @book = Book.new
    end 

    def send_email
      @data = params[:data]
      @book = Book.find(params[:book_id])
      @to_user = User.find(@book.user_id)
      MessageMailer.with(
        from_user: current_user.email, 
        to_user: @to_user.email, 
        title: @data[:title],
        message: @data[:message]
        ).message_sent.deliver_later
      # or perform later
      # SendMailJob.perform_async(params[:data], params[:book_id] )
      flash[:alert] = "Message succesfully sent!!"
      redirect_to book_path(@book) 
      
    end 
  
    def create 
      @book = current_user.books.create(book_params)
      redirect_to @book
    end

    def edit
        @book = Book.find(params[:id])
      end
    
    def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
            redirect_to @book
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
    
        redirect_to root_path, status: :see_other
    end

  
    private
    def book_params
      params.require(:book).permit(:title, :description, :author, :price)
    end
  end
  
  