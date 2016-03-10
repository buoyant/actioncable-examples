App.messages = App.cable.subscriptions.create "MessagesChannel",
  collection: -> $("#messages-list")

  connected: ->
    @start_refreshing()
    @followMessages()

  disconnected: ->
    @unfollowMessages()

  start_refreshing: ->
    $(document).on 'page:change', ->
      @followMessages()

  followMessages: ->
    @perform 'follow'

  unfollowMessages: ->
    @perform 'unfollow'

  received: (data) ->
    @collection().append(data.message) unless @userIsCurrentUser(data.message)

  userIsCurrentUser: (message) ->
    $(message).attr('data-user-id') is $('meta[name=current-user]').attr('id')