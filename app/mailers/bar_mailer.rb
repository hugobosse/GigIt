class BarMailer < ApplicationMailer
  def creation_confirmation(bar)
    @bar = bar
    mail to: bar.user.email , subject: "Welcome! Your bar #{bar.name} has been created !"
  end
end
