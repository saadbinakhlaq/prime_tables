class Input
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def sanitize
    Integer(value)
  end
end
