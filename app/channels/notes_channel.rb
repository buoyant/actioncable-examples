class NotesChannel < ApplicationCable::Channel
  def follow
    stop_all_streams
    stream_from "notes"
  end

  def unfollow
    stop_all_streams
  end
end
