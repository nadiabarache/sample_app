class UsersController < ApplicationController
  def new
  	#le titre personnalisé 
  	# pour la page de nouvel utilisateur
  	@titre ="Inscription"
  end
  def show 

  	 @user =User.find(params[:id])
  end
  def index
  end

end
