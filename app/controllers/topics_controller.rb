class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    @topic = current_user.topics.build
  end

  def show
  end

  def create
    @topic = current_user.topics.build(topic_params)

    if @topic.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_path(@topic)
    else
      render 'edit'
    end
  end

  # def destroy
  #   @topic.destroy
  #   redirect_to root_path
  # end

  private

    def topic_params
      params.require(:topic).permit(:title, :description, :focus, :topic_img)
    end

    def find_topic
      @topic = Topic.find(params[:id])
    end

end
