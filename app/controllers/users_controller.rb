class UsersController < ApplicationController
  def new
  	#le titre personnalisé 
  	# pour la page de nouvel utilisateur
  	@titre ="Inscription"
  end
  def show 
     # trouver les utilisateurs avec leur id
  	 @user =User.find(params[:id])
     @titre =@user.nom
  end
  def index
  end

end
