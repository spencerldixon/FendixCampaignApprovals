class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:new]

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @page = Page.find_by(name: params[:page])
    @contact = Contact.find_by(email: params[:contact]) 

    if @page.nil? or @contact.nil?
      render 'invalid'
    else
      @responses = Array.new(@page.approval_units.count) { Response.new }
      # @responses = []
      # @approval_units = @page.approval_units.order('position ASC')

      # for ad_unit in @approval_units
      #   @responses << Response.new(approval_unit: ad_unit, contact: @contact)
      # end
    end
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @responses = params[:responses].values.collect { |response| Response.new(response) }

    if @responses.all?(&:valid?)
      @responses.each(&:save!)
      render 'success'
    else
      render 'invalid'
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.permit(:response, :contact_id, :approval_unit_id, :visible, :responses)
    end
end
