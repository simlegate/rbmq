module Rbmq
  class Authenticator
    attr_reader :login, :passcode
    def initialize login, passcode
      @login, @passcode = login, passcode
    end

    def run
      raise Errors::FailedAuth unless Models::User.auth(login, passcode)
    end
  end
end
