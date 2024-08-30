class HeartsController < ApplicationController
    before_action :authenticate_user!
    def index
        offset = params[:offset].to_i || 0 
    
        start_date = Date.today - 13.days - offset.days 
        end_date = Date.today - offset.days
        @stars = Star.where(created_at: start_date.beginning_of_day..end_date.end_of_day).order(:created_at)
    
        @chart_data = (start_date..end_date).map do |date|
            stars_on_date = @stars.select { |star| star.created_at.to_date == date }
            {
                date: date.strftime('%b %d'), 
                value: stars_on_date.any? ? stars_on_date.last.genki : nil 
            }
        end
    end
    def new
        @heart = Heart.new
    end
    
    def create
        heart = Heart.new(heart_params)
        heart.user_id = current_user.id  
        if heart.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    def show
        @heart = Heart.find(params[:id])
    end  
    def edit
        @heart = Heart.find(params[:id])
    end
    def update
        heart= Heart.find(params[:id])
        if heart.update(heart_params)
        redirect_to :action => "show", :id => heart.id
        else
        redirect_to :action => "new"
        end
        
    end
    def destroy
        heart = Heart.find(params[:id])
        heart.destroy
        redirect_to action: :index
    end
    def tsubuyaki
        @tsubuyaki = Heart.where(genre:"みんなのつぶやき")
    end
   
    def taiken
        @taiken = Heart.where(genre:"おすすめの場所")
    end
    private
    def heart_params
        params.require(:heart).permit(:body, :genre)
    end
end
