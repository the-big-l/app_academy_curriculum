class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    render :new
  end

  def create
    @crr = CatRentalRequest.new(crr_params)

    respond_to do |format|
      if @crr.save
        @crr.approve!
        format.html { redirect_to cats_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @crr }
      else
        format.html { render :new }
        format.json { render json: @crr.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  private

  def crr_params
    params.require(:crr).permit(:start_date, :end_date, :cat_id)
  end
end
