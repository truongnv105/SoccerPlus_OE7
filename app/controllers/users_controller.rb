class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]

    if @user.nil?
      flash[:danger] = t "user_not_exist"
      redirect_to root_url
    end
  end
end
