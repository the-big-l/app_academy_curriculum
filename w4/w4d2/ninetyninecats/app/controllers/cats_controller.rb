class CatsController < ApplicationController
  def index
    @cats = Cat.all.order(:id)
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def update
    cat = Cat.find_by(id: params[:id])
    if cat.update(cat_params)
      redirect_to cat_url(cat)
    else
      cat.errors.full_messages
    end
  end

  def create
    cat = Cat.new(cat_params)

    if cat.save
      redirect_to cat_url(cat)
    else
      cat.errors.full_messages
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :color, :sex, :birth_date, :description)
  end
end
