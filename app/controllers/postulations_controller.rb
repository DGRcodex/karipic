class PostulationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @offer = Offer.find(params[:postulation][:offer_id])
    @user = current_user
    @postulation = Postulation.new(postulation_params)
    @postulation.user = @user
    @postulation.offer = @offer
    if @postulation.save!
      msg =  Message.new(
        title: "El usuario #{@user.email} se postuló a la oferta #{@offer.title}",
        message: "El usuario #{@user.email} se postuló a la oferta #{@offer.title} dirigete a <a href='#{profile_path(@user)}'></a> para ver su perfil y decidir si lo contratas o no".html_safe,
        user: User.find_by(role: 1)
      )
      if msg.save!
      redirect_to offer_path(@offer)
      else
        return "message failed"
      end
    else
      return "postulation failed"
    end
  end

  private

  def postulation_params
    params.require(:postulation).permit(:why_me)
  end
end
