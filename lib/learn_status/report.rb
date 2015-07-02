module LearnStatus
  class Report
    attr_reader   :client
    attr_accessor :status

    def initialize
      _login, token = Netrc.read['learn-config']
      @client       = LearnWeb::Client.new(token: token)
    end

    def self.generate
      new.generate
    end

    def generate
      self.status = client.current_status
    end
  end
end
