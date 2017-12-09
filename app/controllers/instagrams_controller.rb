class InstagramsController < ApplicationController
  before_action :set_instagram, only: [:show, :edit, :update, :destroy]

  def index
    @Instagram = Instagram.new
    @image = Instagram.all
  end

  def show
    @favorite = current_user.favorites.find_by(instagram_id: @instagram.id)
  end

  def edit
  end

  def update
    if @instagram.update(instagram_update_params)
      redirect_to instagrams_index_path
    else
      render 'index'
    end
  end

  def upload
    @Instagram = Instagram.new(instagram_params)
    if @Instagram.save
      ContactMailer.contact_mail(@Instagram,current_user).deliver
      redirect_to instagrams_index_path
    else
      render 'index'
    end
  end

  def destroy
    @instagram.destroy
    redirect_to instagrams_index_path
  end

  private
  def instagram_params
    params.require(:instagram).permit(:user_id, :content, :image)
  end

  def instagram_update_params
    params.require(:instagram).permit(:user_id, :content)
  end

  def set_instagram
  @instagram = Instagram.find(params[:id])
  end
end
