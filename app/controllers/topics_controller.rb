class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :owned_topic, only: [:edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @published_topics = current_user.topics.published
    @unpublished_topics = current_user.topics.unpublished
  end

  # GET /mytopics
  # GET /mytopics.json
  def my_topic
    @published_topics = current_user.topics.published
    @unpublished_topics = current_user.topics.unpublished
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = current_user.topics.new
  end

  # GET /topics/1/edit
  def edit
  end

  def feedline
    @topics = Topic.published
  end

  # topic /topics
  # topic /topics.json
  def create
    if params[:is_draft]
      @topic = current_user.topics.create(topic_params)
      if @topic.save
        flash[:notice] = "Topic successfully save as draft."
        redirect_to @topic
      else
        render 'new'
      end
    else
      @topic = current_user.topics.new(topic_params)
      @topic.is_draft = false
      if @topic.save
        flash[:success] = "Topic successfully published."
        redirect_to @topic
      else
        render 'new'
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
      unless params[:is_draft]
        @topic.is_draft = false
        if @topic.update(topic_params)
          redirect_to @topic, success: 'Topic successfully published.'
        else
          render 'edit'
        end
      else
        @topic.is_draft = true
        if @topic.update(topic_params)
          redirect_to @topic, notice: 'Topic save as draft.'
        else
          render 'edit'
        end
      end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to :back, success: 'Topic successfully deleted.' }
      format.js { render 'destroy_topic.js.erb' }
    end
  end

  private
    # Use callback to authorize topic
    def owned_topic
      unless current_user.id == @topic.user_id
        flash[:alert] = "Opps! You don't have permission to do that."
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:user_id, :title, :body, :is_draft, :is_open)
    end
end
