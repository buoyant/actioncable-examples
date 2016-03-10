class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  after_commit { MessageRelayJob.perform_later(self) }
end
