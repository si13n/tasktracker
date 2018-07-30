class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all
        @team_names = Team.all.collect {|team| [ team.name, team.id ] }
        @team_names.unshift("All teams")
    end

    def delete_avatar
        @avatar = current_user.avatar
        @avatar.purge
        redirect_to edit_user_registration_path
    end

    def show
        @user = User.find(params[:id])
    end
end
