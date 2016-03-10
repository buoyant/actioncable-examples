class Note < ActiveRecord::Base
  belongs_to :user

  after_commit { NoteRelayJob.perform_later(self) }
end
