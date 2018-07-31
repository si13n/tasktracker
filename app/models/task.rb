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
        where("status LIKE ?", "%#{params[:status]}%").
        where("priority LIKE ?", "%#{params[:priority]}%").
        where("tst LIKE ?", "%#{params[:tst]}%").
        where("dev LIKE ?", "%#{params[:dev]}%")
    end

end
