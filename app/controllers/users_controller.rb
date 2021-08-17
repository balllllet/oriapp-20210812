class UsersController < ApplicationController
  before_action :move_index, only: [:edit, :update, :destroy]
  before_action :authenticate_user!,except: [:index, :show]
  before_action :find_user_id, only: [:show, :edit, :update, :destroy]



  def show
  end

  def edit
  end 

  def update
  end

  def destroy
  end





  def id_params
    params.require(:user).permit(:id)
  end

private
  def user_params
    params.require(:user).permit(:nickname, :introduction, :description, :email, :tel, :family_name, :first_name, :family_name_reading, :first_name_reading).merge(user_id: current_user.id)
  end

  def move_index
    if @item.user.id != current_user.id
     redirect_to action: :index
    end
  end

  def find_user_id
    @user = User.find(params[:id])
  end

end
