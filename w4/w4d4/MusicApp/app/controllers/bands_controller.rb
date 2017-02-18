class BandsController < ApplicationController
  before_action :require_login!#, only: [:show, :edit, :update, :destroy]

  # GET /bands
  # GET /bands.json
  def index
    @bands = Band.all.order(:name)
  end

  # GET /bands/1
  # GET /bands/1.json
  def show
    @band = Band.find(params[:id])
    render :show
  end

  # GET /bands/new
  def new
    @band = Band.new
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  # POST /bands
  # POST /bands.json
  def create
    @band = Band.new(band_params)

    respond_to do |format|
      if @band.save
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render :show, status: :created, location: @band }
      else
        format.html { render :new }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bands/1
  # PATCH/PUT /bands/1.json
  def update
    @band = Band.find(params[:id])
    respond_to do |format|
      if @band.update(band_params)
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
        format.json { render :show, status: :ok, location: @band }
      else
        format.html { render :edit }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  def destroy
    @band.destroy
    redirect_to bands_url, notice: 'Band was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def require_login!
    #   redirect_to new_login_url unless logged_in?
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def band_params
      params.require(:band).permit(:name)
    end
end
