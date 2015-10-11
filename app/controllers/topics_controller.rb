class TopicsController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all.order("created_at DESC")
  end

  def new
    @topic = Topic.new
  end

  def show
  end

  def create
    @topic = Topic.new(topic_params)

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

  def destroy
  end

  private

    def topic_params
      params.require(:topic).permit(:title, :description, :focus)
    end

    def find_book
      @topic = Topic.find(params[:id])
    end

end
