class FeedbacksController < ApplicationController
    def create
      @feedback = Feedback.new(feedback_params)
      if @feedback.save
        redirect_to feedbacks_path, notice: 'Feedback was successfully created.'
      else
        render :new
      end
    end
  
    def index
      @feedbacks = Feedback.all
    end
  
    private
      def feedback_params
        params.require(:feedback).permit(:name, :email, :content)
      end
  end
  