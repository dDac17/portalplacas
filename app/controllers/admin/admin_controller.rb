class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end
  def show
  end

  def edit_user
    @user = User.find(params[:id])
  end
  
  def update_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_index_path, notice: 'Usuario actualizado exitosamente.'
    else
      render :edit_user
   end
  end 

   def destroy_user
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_index_path, notice: 'Usuario eliminado exitosamente.'
   end

   def make_admin
    user = User.find(params[:id])
    user.update(admin: true)
    redirect_to admin_index_path, notice: 'Usuario ahora es un administrador.'
  end

  private

  def authenticate_admin!
    unless current_user && current_user.admin?
      redirect_to root_path, alert: 'Acceso no autorizado.'
    end
  end
  def user_params
    params.require(:user).permit(:email, :admin)
  end
end
