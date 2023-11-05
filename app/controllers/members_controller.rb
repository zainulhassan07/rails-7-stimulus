class MembersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit_description update_description edit_personal_details update_personal_details]

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit_description;   end

  def update_description
    if current_user.update(about: params[:user][:about])
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('member-description', partial: 'members/member_description', locals: { user: current_user })
        end
      end
    end
  end
  
  def edit_personal_details; end

  def update_personal_details; end
end
