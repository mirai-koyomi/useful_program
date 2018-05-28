class MillsecConvertsController < ApplicationController
  before_action :set_millsec_convert, only: [:show, :edit, :update, :destroy]

  # GET /millsec_converts
  # GET /millsec_converts.json
  def index
    @millsec_converts = MillsecConvert.all
  end

  # GET /millsec_converts/1
  # GET /millsec_converts/1.json
  def show
  end

  # GET /millsec_converts/new
  def new
    @millsec_convert = MillsecConvert.new
  end

  # GET /millsec_converts/1/edit
  def edit
  end

  # POST /millsec_converts
  # POST /millsec_converts.json
  def create
    @millsec_convert = MillsecConvert.new(millsec_convert_params)

    respond_to do |format|
      if @millsec_convert.save
        format.html { redirect_to @millsec_convert, notice: 'Millsec convert was successfully created.' }
        format.json { render :show, status: :created, location: @millsec_convert }
      else
        format.html { render :new }
        format.json { render json: @millsec_convert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /millsec_converts/1
  # PATCH/PUT /millsec_converts/1.json
  def update
    respond_to do |format|
      if @millsec_convert.update(millsec_convert_params)
        format.html { redirect_to @millsec_convert, notice: 'Millsec convert was successfully updated.' }
        format.json { render :show, status: :ok, location: @millsec_convert }
      else
        format.html { render :edit }
        format.json { render json: @millsec_convert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /millsec_converts/1
  # DELETE /millsec_converts/1.json
  def destroy
    @millsec_convert.destroy
    respond_to do |format|
      format.html { redirect_to millsec_converts_url, notice: 'Millsec convert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_millsec_convert
      @millsec_convert = MillsecConvert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def millsec_convert_params
      params.require(:millsec_convert).permit(:before_time, :after_time, :difference, :millsec, :comment)
    end
end
