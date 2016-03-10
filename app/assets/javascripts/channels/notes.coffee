App.notes = App.cable.subscriptions.create "NotesChannel",
  collection: -> $("#notes-list")

  connected: ->
    @start_refreshing()
    @followNotes()

  disconnected: ->
    @unfollowNotes()

  start_refreshing: ->
    $(document).on 'page:change', ->
      @followNotes()

  followNotes: ->
    @perform 'follow'

  unfollowNotes: ->
    @perform 'unfollow'

  received: (data) ->
    @collection().append(data.note) unless @userIsCurrentUser(data.note)

  userIsCurrentUser: (note) ->
    $(note).attr('data-user-id') is $('meta[name=current-user]').attr('id')