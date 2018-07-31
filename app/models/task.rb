class Task < ApplicationRecord
    def self.priority
        ["Low", "Middle", "High", "Critical", "Urgent", "RTH"]
    end

    def self.status
        ["New", "Investigation", "Coding", "Implemented", "Testing", "Rework", "Tested", "Closed", "Canceled"]
    end
end
