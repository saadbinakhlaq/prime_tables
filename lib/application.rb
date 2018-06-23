require 'i18n'
Dir[File.dirname(__FILE__) + '/application/*.rb'].each { |file| require file }
I18n.config.available_locales = :en
I18n.load_path = Dir['locales/*.yml']

class Application
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def run
    number = sanitize_input(@input)
    first_n_primes = prime_list(number)
    Output.new.table(first_n_primes)
  end

  private

  def prime_list(number)
    @_prime ||= Prime.new.take(number)
  rescue Errors::InvalidArgument => error
    print error.message
    exit(1)
  end

  def sanitize_input(value)
    Input.new(value).sanitize
  rescue ArgumentError, TypeError
    print I18n.t('errors.invalid_argument')
    exit(1)
  end
end
