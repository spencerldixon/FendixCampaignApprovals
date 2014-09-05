class ApprovalUnitsController < ApplicationController
  before_action :set_approval_unit, only: [:show, :edit, :update, :destroy]

  # GET /approval_units
  # GET /approval_units.json
  def index
    @approval_units = ApprovalUnit.all
  end

  # GET /approval_units/1
  # GET /approval_units/1.json
  def show
  end

  # GET /approval_units/new
  def new
    @approval_unit = ApprovalUnit.new
  end

  # GET /approval_units/1/edit
  def edit
  end

  # POST /approval_units
  # POST /approval_units.json
  def create
    @approval_unit = ApprovalUnit.new(approval_unit_params)

    respond_to do |format|
      if @approval_unit.save
        format.html { redirect_to @approval_unit, notice: 'Approval unit was successfully created.' }
        format.json { render :show, status: :created, location: @approval_unit }
      else
        format.html { render :new }
        format.json { render json: @approval_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approval_units/1
  # PATCH/PUT /approval_units/1.json
  def update
    respond_to do |format|
      if @approval_unit.update(approval_unit_params)
        format.html { redirect_to @approval_unit, notice: 'Approval unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @approval_unit }
      else
        format.html { render :edit }
        format.json { render json: @approval_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approval_units/1
  # DELETE /approval_units/1.json
  def destroy
    @approval_unit.destroy
    respond_to do |format|
      format.html { redirect_to approval_units_url, notice: 'Approval unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval_unit
      @approval_unit = ApprovalUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_unit_params
      params.require(:approval_unit).permit(:page_id, :format, :value, :position)
    end
end
