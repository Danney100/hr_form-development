class ServiceError < StandardError

  attr_reader :messages

  def initialize(messages)
    @messages = convert_to_array(messages)
  end

  private

  # NOTE: This is intended as a safeguard. Messages should explicitly be passed in as an array whenever possible.
  def convert_to_array(messages)
    if messages.is_a?(String)
      return [messages]
    else
      return messages
    end
  end

end # class ServiceError
