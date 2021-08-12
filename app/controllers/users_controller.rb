class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def id_params
    params.require(:user).permit(:id)
  end
end
