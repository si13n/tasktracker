class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def delete_avatar
        @avatar = current_user.avatar
        @avatar.purge
        redirect_to edit_user_registration_path
    end
end
