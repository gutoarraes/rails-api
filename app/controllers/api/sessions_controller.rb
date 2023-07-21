class Api::SessionController < ApplicationController

  def create
    session[:id]  #?
  end

  def destroy
    # quando o usuario aperta logout, OU depois de tempo desconectado - eu nao sei fazer essa ultima parte ainda+
    session[:id].delete
  end
end
