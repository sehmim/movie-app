class PlaysController < ApplicationController

    before_action :find_play, only: [:edit, :update, :show, :destroy]

    def index
        @plays = Play.all.order("Created_at DESC")
    end
    
    def new
        @play = current_user.plays.build
        # @catagories = Catagory.all.map{ |c| [c.name, c.id] }
    end

    def show
    end
    

    def create
        @play = current_user.plays.build(play_params)
        # @play.category_id = params[:category_id]
        if @play.save
            redirect_to root_path
        else 
            render 'new'
        end
        
    end

    def update
        # @play.category_id = params[:category_id]

        if @play.update(play_params)
            redirect_to play_path(@play)
        else
            render 'edit'
        end
    end

    def edit
        # @catagories = Catagory.all.map{ |c| [c.name, c.id] }
    end

    def destroy
        @play.destroy
        redirect_to root_path
    end
    
    
    
    
    private 
    def play_params
        params.require(:play).permit(:title, :description, :director, :play_img)
    end

    def find_play
        @play = Play.find(params[:id])
    end
    
end
