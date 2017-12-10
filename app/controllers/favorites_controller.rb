class FavoritesController < ApplicationController
  def show
    @favorite = current_user.favorites.where(user_id: current_user.id)
    render layout: 'favorite'
  end

  def create
    favorite = current_user.favorites.create(instagram_id: params[:instagram_id])
    redirect_to instagram_path(params[:instagram_id]), notice: "#{favorite.instagram.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(instagram_id: params[:instagram_id]).destroy
    redirect_to instagram_path(params[:instagram_id]), notice: "#{favorite.instagram.user.name}さんのブログをお気に入り解除しました"
  end
end
