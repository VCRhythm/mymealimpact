class ImpactsController < ApplicationController
  before_action :set_impact, only: [:show, :edit, :update, :destroy]

  # GET /impacts
  # GET /impacts.json
  def index
    @impacts = Impact.all
  end

  # GET /impacts/1
  # GET /impacts/1.json
  def show
		@source_country = @impact.source_country_name
	end

	def choose
		@foods = Food.all
		@local_country = request.location.country_code
	end
 
	def search
		@impact = Impact.where(food_id: params[:impact][:food_id], source_code: params[:impact][:source_code] ).first
		if @impact
			redirect_to @impact, notice: 'Impact was found.' 
		else 
			redirect_to root_url, notice: 'No impact was found.'
		end
	end

  # GET /impacts/new
  def new
    @impact = Impact.new
  end

  # GET /impacts/1/edit
  def edit
  end

  # POST /impacts
  # POST /impacts.json
  def create
    @impact = Impact.new(impact_params)

    respond_to do |format|
      if @impact.save
        format.html { redirect_to @impact, notice: 'Impact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @impact }
      else
        format.html { render action: 'new' }
        format.json { render json: @impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /impacts/1
  # PATCH/PUT /impacts/1.json
  def update
    respond_to do |format|
      if @impact.update(impact_params)
        format.html { redirect_to @impact, notice: 'Impact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impacts/1
  # DELETE /impacts/1.json
  def destroy
    @impact.destroy
    respond_to do |format|
      format.html { redirect_to impacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impact
      @impact = Impact.find(params[:id])
    end

# Never trust parameters from the scary internet, only allow the white list through.
    def impact_params
      params.require(:impact).permit(:detail, :food_id, :source_code, :destination_code)
    end
end
