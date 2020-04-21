class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "audio_messages"
  end
end
