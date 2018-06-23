module Errors
  class InvalidArgument < StandardError
    def initialize(msg = I18n.t('errors.invalid_argument'))
      super
    end
  end
end
