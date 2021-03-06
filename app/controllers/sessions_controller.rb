class SessionsController < ApplicationController
  before_action :public_access, except: [:destroy]
  before_action :private_acces, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path
    else
      flash[:notice] = "Usuario o contraseña invalidos"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
