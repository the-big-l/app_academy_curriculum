class TracksController < ApplicationController
  before_action :require_login!#, only: [:show, :edit, :update, :destroy]

  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = Track.all
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    @track = Track.find(params[:id])
    render :show
  end

  # GET /tracks/new
  def new
    @track = Track.new
    @track.album_id = params[:album_id]
    @track.no = Album.find(params[:album_id]).next_track_no
  end

  # GET /tracks/1/edit
  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to album_url(params[:track][:album_id]), notice: 'Track was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    @track = Track.find(params[:id])
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:album_id, :title, :no, :lyrics)
    end
end
