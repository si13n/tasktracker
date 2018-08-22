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
    logger.debug 
    where("project LIKE ?", "%#{params[:project]}%")
      .where(
        if params[:status]
          params[:status].map { |s| "status LIKE '%#{s}%' or "}.join()[0...-4]
        end
      )
      .where("priority LIKE '%#{params[:priority]}%'")
  end
end
