class NotificationMailer < ApplicationMailer

  def add_comment_notification comment
    @product = comment.product
    @admin = User.first
    @comment = comment
    mail(to: @admin.email, subject: "[HS-Store] You have a new comment!")
  end
end
