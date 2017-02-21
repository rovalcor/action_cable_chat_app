$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()

  id = $("#con-data").data("conversation-id")
  MakeConversationsChannel(id)

submit_message = () ->
  $('#content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  if $('#messages').length
    $('#messages').scrollTop($('#messages')[0].scrollHeight)

MakeConversationsChannel = (conversation_id) ->
  App.conversations = App.cable.subscriptions.create { channel: "ConversationsChannel", conversation_id: conversation_id },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      unless data.message.blank?
        $('#messages-table').append data.message
        scroll_bottom()
