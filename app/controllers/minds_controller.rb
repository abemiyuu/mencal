class MindsController < ApplicationController
    def index
    end

    def new
        @mind = Mind.new
    end

    def show
        @mind = Mind.find_by(id: params[:id])
        @star = Star.new
        @heart = Heart.new
        
    end

    def create
        mind = Mind.new(mind_params)
        if mind.save
            flash[:notice] = "診断が完了しました"
            redirect_to mind_path(mind.id)
        else
            redirect_to :action => "new"
        end
    end
  
  private
    def mind_params
        params.require(:mind).permit(:question1, :question2, :question3, :question4, :question5)
    end
end
