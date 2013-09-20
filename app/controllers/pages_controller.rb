class PagesController < ApplicationController
  #le controller Pages avec le titre suivant la page @titre

def index
  @titre ="Accueil"
end


  def home
  	@titre ="Accueil"
  end

  def contact
  	@titre ="Contact"
  end

  def about
  	@titre ="A propos"
  end
 
  def help
    @title ="Aide"
  end


end
