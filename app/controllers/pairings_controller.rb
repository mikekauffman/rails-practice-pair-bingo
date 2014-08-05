class PairingsController < ApplicationController
  def new
    @pairing = Pairing.new
    @user = current_user
    @pair = User.find(params[:user_id])
  end

  def create
    pair = User.find(params[:user_id])
    pairing = Pairing.new(params.require('pairing').permit(:date))
    pairing.user_id = current_user.id
    pairing.pair_id = pair.id
    if pairing.save
      redirect_to root_path
    end
  end

end