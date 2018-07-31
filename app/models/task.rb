class Task < ApplicationRecord
    def self.priority
        ["Low", "Middle", "High", "Critical", "Urgent", "RTH"]
    end

    def self.status
        ["New", "Investigation", "Coding", "Implemented", "Testing", "Rework", "Tested", "Closed", "Canceled"]
    end

    scope :search, -> (params) do
        where("id LIKE ? OR summary LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    scope :tasks, -> (params) do
        where("project LIKE ?", "%#{params[:project]}%").
        where(
            if params[:status]
                if params[:status].length == 2
                    "status LIKE '%#{params[:status][0]}%' or
                     status LIKE '%#{params[:status][1]}%'"
                elsif params[:status].length == 3
                   "status LIKE '%#{params[:status][0]}%' or
                    status LIKE '%#{params[:status][1]}%' or
                    status LIKE '%#{params[:status][2]}%'"
                else
                    "status LIKE '%#{params[:status].first}%' "
                end
            end
        ).
        where("priority LIKE ?", "%#{params[:priority]}%").
        where("tst LIKE ?", "%#{params[:tst]}%").
        where("dev LIKE ?", "%#{params[:dev]}%")
    end

end

