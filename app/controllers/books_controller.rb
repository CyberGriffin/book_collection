class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(params.require(:book).permit(:title, :author, :price, :published_date))
        if (@book.save)
            redirect_to @book, notice: 'Book was successfully created.'
        else
            render :new
        end
    end

    def update
        @book = Book.find(params[:id])
        if (@book.update(params.require(:book).permit(:title, :author, :price, :published_date)))
            redirect_to @book, notice: 'Book was successfully updated.'
        else
            render :edit
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    def delete
        @book = Book.find(params[:id])
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to root_path, notice: 'Book was successfully deleted.'
    end

    def edit
        @book = Book.find(params[:id])
    end
end