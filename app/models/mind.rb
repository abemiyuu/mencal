class Mind < ApplicationRecord
    validates :question1, :question2, :question3, :question4, :question5, presence: true   
end
