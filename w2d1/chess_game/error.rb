

class InvalidMove < StandardError
  def initialize(message)
    @message = message
  end

end
