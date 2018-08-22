class Task < ApplicationRecord
  has_many :tags
  has_many :comments

  has_many_attached :attachmnets

  def self.priority
    ["Low", "Middle", "High", "Critical", "Urgent", "RTH"]
  end

  def self.status
    %w[New Investigation Coding Implemented Testing Rework Tested Closed Canceled]
  end

  scope :search, ->(params) do
    where("id LIKE ? OR summary LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
  end

  scope :tasks, -> (params) do
    where("project LIKE ?", "%#{params[:project]}%")
      .where(
        if params[:status]
          if params[:status].length == 2
            "status LIKE '%#{params[:status][0]}%' or
            status LIKE '%#{params[:status][1]}%'"
          elsif params[:status].length == 3
            "status LIKE '%#{params[:status][0]}%' or
            status LIKE '%#{params[:status][1]}%' or
            status LIKE '%#{params[:status][2]}%'"
          elsif params[:status].length == 4
            "status LIKE '%#{params[:status][0]}%' or
            status LIKE '%#{params[:status][1]}%' or
            status LIKE '%#{params[:status][2]}%' or
            status LIKE '%#{params[:status][3]}%'"
          elsif params[:status].length == 5
            "status LIKE '%#{params[:status][0]}%' or
            status LIKE '%#{params[:status][1]}%' or
            status LIKE '%#{params[:status][2]}%' or
            status LIKE '%#{params[:status][3]}%' or
            status LIKE '%#{params[:status][4]}%'"
          else
            "status LIKE '%#{params[:status][0]}%' "
          end
        end
      )
      .where("priority LIKE '%#{params[:priority]}%'")
  end
end
