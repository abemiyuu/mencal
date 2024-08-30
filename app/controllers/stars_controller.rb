class StarsController < ApplicationController
    def new
        @star = Star.new
    end
    def create
        star = Star.new(star_params.merge(user_id: current_user.id))
        if star.save
            flash[:notice] = '投稿が成功しました'
            redirect_to hearts_path 
        else
            flash[:alert] = '投稿に失敗しました'
            redirect_to new_star_path
        end
     end
private

    def star_params
    params.require(:star).permit(:genki)
    end
end
