
# ------  Note ------------#
   # params : Contient des infos sur chaque requete





class UsersController < ApplicationController
  def new
  	#le titre personnalisé 
  	# pour la page de nouvel utilisateur
    @user =User.new
  	@titre ="Inscription"
  end
 
  def show 
     # trouver les utilisateurs avec leur id
  	 @user =User.find(params[:id])
     @titre =@user.nom
  end
  
  def index
  end

  def create
    @user =User.new(params[:user])
    if @user.save
      flash[:success] = "Bienvenue !" 
      redirect_to @user
      # traite un succés d'enregistrement
    else
      @titre="Inscription"
      render 'new'
    end
  end

end
