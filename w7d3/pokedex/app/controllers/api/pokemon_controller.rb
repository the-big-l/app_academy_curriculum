class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end

  def show
    @poke = Pokemon.find(params[:id])
    # .includes(:items)
  end

  def create

  end

  def update

  end

  def destroy

  end
end
