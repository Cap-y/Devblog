class GamesController < ApplicationController

  def index
    @games = Game.order('created_at')
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:success] = "The file was added!"
      redirect_to root_path
    else
      render 'new'
    end

  end

  def download

    @game = Game.find(params[:id])

    send_file @game.file.path,
              :filename => 'test.zip',
              :type => 'application',
              :disposition => 'attachment'

  end

  private

  def game_params
    params.require(:game).permit(:file, :title)
  end

end
