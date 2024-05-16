module V2
  class ReviewsController < ApplicationController

    include ErrorSerializer
    before_action :authenticate_user!
    before_action :set_review, only: %i[ show update destroy ]

    def index
      @reviews = Review.where(filter_params)

      render json: @reviews
    end

    def show
      @review = Review.find(params[:id])

      render json: @review
    end

    def create
      @review = Review.new(review_params)

      if @review.save
        render json: @review, status: :created
      else
        render json: ErrorSerializer.serialize(@review.errors)
      end
    end


    def update
      if @review.update(review_params)
        render json: @review
      else
        render json: ErrorSerializer.serialize(@review.errors)
      end
    end

    def destroy
      @review.destroy!
    end

    private
    def set_review
      @review = Review.find(params[:id])
    end
    def filter_params
      params.permit(:user_id, :book_id, :rating)
    end

    def review_params
      params.require(:review).permit(:rating, :comment, :user_id, :book_id)
    end
  end
end
