module V2
  class PublishingCompaniesController < ApplicationController
    include ErrorSerializer

    # before_action :authenticate_user!
    before_action :set_publishing_company, only: %i[ show update destroy ]

    # GET /publishing_companies
    def index
      page_number = params[:page].try(:[], :number)
      per_page = params[:page].try(:[], :size)

      @publishing_companies = PublishingCompany.all.page(page_number).per(per_page)

      render json: @publishing_companies
    end

    # GET /publishing_companies/1
    def show
      render json: @publishing_company, include: :books
    end

    # POST /publishing_companies
    def create
      @publishing_company = PublishingCompany.new(publishing_company_params)

      if @publishing_company.save
        render json: @publishing_company, status: :created, location: @publishing_company
      else
        render json: ErrorSerializer.serialize(@publishing_company.errors) #, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /publishing_companies/1
    def update
      if @publishing_company.update(publishing_company_params)
        render json: @publishing_company
      else
        render json: ErrorSerializer.serialize(@publishing_company.errors) #, status: :unprocessable_entity
      end
    end

    # DELETE /publishing_companies/1
    def destroy
      @publishing_company.destroy!
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_publishing_company
        if params[:book_id]
          @publishing_company = Book.find(params[:book_id]).publishing_company
          return @kind
        end
        @publishing_company = PublishingCompany.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def publishing_company_params
        params.require(:publishing_company).permit(:company_name)
      end
  end
end