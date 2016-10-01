class NotificationJob < ActiveJob::Base
  queue_as :default

  def perform(comment_id)
    comment = Comment.find(comment_id)
    NotificationMailer.add_comment_notification(comment).deliver_later
  end
end
