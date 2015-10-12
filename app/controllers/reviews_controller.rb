class ReviewsController < ApplicationController
  before_action :find_topic
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.topic_id = @topic.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_topic
    @topic = Topic.find(params[:topic_id])

  end

end
