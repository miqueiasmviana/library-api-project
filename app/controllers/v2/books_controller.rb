module V2
  class BooksController < ApplicationController

    # before_action :authenticate_user!
    include ErrorSerializer
    before_action :set_book, only: %i[ show update destroy ]

    # GET /books
    def index
      page_number = params[:page].try(:[], :number)
      per_page = params[:page].try(:[], :size)

      @books = Book.all.page(page_number).per(per_page)
      
      render json: @books
    end

    # GET /books/1
    def show
      @book = Book.find(params[:id])
      
      render json: @book, include: [:kind, :author, :publishing_company, :reviews]
    end

    # POST /books
    def create
      @book = Book.new(book_params)

      if @book.save
        render json: @book, status: :created, location: @book
      else
        render json: ErrorSerializer.serialize(@book.errors) #, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /books/1
    def update
      if @book.update(book_params)
        render json: @book
      else
        render json: ErrorSerializer.serialize(@book.errors) #, status: :unprocessable_entity
      end
    end

    # DELETE /books/1
    def destroy
      @book.destroy!
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def book_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
  end
end