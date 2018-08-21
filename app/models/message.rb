class Message < ActiveRecord::Base
  scope :sorted, -> { order(created_at: :asc) }
end
