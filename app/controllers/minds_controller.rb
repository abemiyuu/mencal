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
    def brank
    end
    def create
        mind = Mind.new(mind_params)
        if mind.save
            flash[:notice] = "診断が完了しました"
            redirect_to mind_path(mind.id)
        else
            redirect_to :action => "brank"
        end
    end
  
  private
  def mind_params
    params.fetch(:mind, {}).permit(:question1, :question2, :question3, :question4,  :question5)
end
end
