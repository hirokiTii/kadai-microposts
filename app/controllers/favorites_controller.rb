class FavoritesController < ApplicationController
  before_action
  
  def show
    @favorites = current_user.myfavorites.page(params[:page])
  end
 
  def create
   micropost = Micropost.find(params[:micropost_id])
   current_user.add_favorites(micropost)
   flash[:success] = 'お気に入りに登録しました'
   redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.delete_favorites(micropost)
    flash[:success] = 'お気に入り登録を解除しました'
    redirect_back(fallback_location: root_url)
  end
end
