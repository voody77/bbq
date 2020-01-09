class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_current_user, except: [:show]

  def show
    @user = User.find(params[:id])
  end


  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to @user, notice: I18n.t('controllers.users.updated')
      else
        render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_current_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
