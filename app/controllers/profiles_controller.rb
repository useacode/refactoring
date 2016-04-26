class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @topics = User.find_by(username: params[:username]).topics.order('created_at DESC')
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to profile_path(@user.username)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private
    def set_user
      @user = User.find_by(username: params[:username])
    end

    def profile_params
      params.require(:user).permit(:avatar, :about)
    end
end
