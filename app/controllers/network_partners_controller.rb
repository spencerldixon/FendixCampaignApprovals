class NetworkPartnersController < ApplicationController
  before_action :set_network_partner, only: [:show, :edit, :update, :destroy]

  # GET /network_partners
  # GET /network_partners.json
  def index
    @network_partners = NetworkPartner.all
  end

  # GET /network_partners/1
  # GET /network_partners/1.json
  def show
  end

  # GET /network_partners/new
  def new
    @network_partner = NetworkPartner.new
  end

  # GET /network_partners/1/edit
  def edit
  end

  # POST /network_partners
  # POST /network_partners.json
  def create
    @network_partner = NetworkPartner.new(network_partner_params)

    respond_to do |format|
      if @network_partner.save
        format.html { redirect_to @network_partner, notice: 'Network partner was successfully created.' }
        format.json { render :show, status: :created, location: @network_partner }
      else
        format.html { render :new }
        format.json { render json: @network_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network_partners/1
  # PATCH/PUT /network_partners/1.json
  def update
    respond_to do |format|
      if @network_partner.update(network_partner_params)
        format.html { redirect_to @network_partner, notice: 'Network partner was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_partner }
      else
        format.html { render :edit }
        format.json { render json: @network_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network_partners/1
  # DELETE /network_partners/1.json
  def destroy
    @network_partner.destroy
    respond_to do |format|
      format.html { redirect_to network_partners_url, notice: 'Network partner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_partner
      @network_partner = NetworkPartner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_partner_params
      params.require(:network_partner).permit(:name, :urn)
    end
end
