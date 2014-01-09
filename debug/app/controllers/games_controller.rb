class GamesController < ApplicationController

  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @games }
    end
  end

  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:games])
    respond_to do |format|
      if @game.save
        redirect_to @game
      end
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update 
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html {redirect_to games_url }
      format.json { head :no_content }
    end
  end
end  
