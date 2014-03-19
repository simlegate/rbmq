module Client
  def connect
    Stomp::Client.new("admin", "admin", "localhost", 61613)
  end
end
