class EmailInterceptor
  def self.delivering_email(message)
    message.subject = "Welcome to Gigit"
    message.to = [ 'patgourrier@gmail.com' ]
  end
end
