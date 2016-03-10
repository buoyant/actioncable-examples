class NoteRelayJob < ApplicationJob
  def perform(note)
    ActionCable.server.broadcast "notes",
      note: ExamplesController.render(partial: 'examples/note', locals: { note: note })
  end
end