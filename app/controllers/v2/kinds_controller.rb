module V2
  class KindsController < ApplicationController

    include ErrorSerializer
    before_action :set_kind, only: %i[ show update destroy ]

    # GET /kinds
    def index
      page_number = params[:page].try(:[], :number)
      per_page = params[:page].try(:[], :size)

      @kinds = Kind.all.page(page_number).per(per_page)

      render json: @kinds
    end

    # GET /kinds/1
    def show
      render json: @kind
    end

    # POST /kinds
    def create
      @kind = Kind.new(kind_params)

      if @kind.save
        render json: @kind, status: :created, location: @kind
      else
        render json: ErrorSerializer.serialize(@kind.errors) #, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /kinds/1
    def update
      if @kind.update(kind_params)
        render json: @kind
      else
        render json: ErrorSerializer.serialize(@kind.errors) #, status: :unprocessable_entity
      end
    end

    # DELETE /kinds/1
    def destroy
      @kind.destroy!
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_kind
        if params[:book_id]
          @kind = Book.find(params[:book_id]).kind
          return @kind
        end
        @kind = Kind.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def kind_params
        params.require(:kind).permit(:genre, :book_id)
      end
  end
end