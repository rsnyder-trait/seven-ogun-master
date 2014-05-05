class ContactForm
  attr_accessor :name, :email, :phone, :message, :errors

  def initialize(options = {})
    @name = options[:name]
    @email = options[:email]
    @phone = options[:phone]
    @message = options[:message]
    @errors = {}
  end

  def valid?
    validate
    @errors.empty?
  end

  def validate
    validate_name
    validate_email
    validate_phone
    validate_message
  end

  def has_error?(error)
    @errors.has_key? error
  end

  private

  def validate_name
    if @name.nil? || @name.empty?
      @errors[:name] = 'Please enter your name.'
    end
  end

  def validate_email
    if @email.nil? || @email.empty?
      @errors[:email] = 'Please enter your email address.'
    end
    unless @email =~ /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
      @errors[:email] = 'Please enter a valid email address.'
    end
  end

  def validate_phone
    unless @phone.nil? || @phone.empty? || @phone.gsub(/[^0-9]/,'') =~ /^[0-9]{10}$/
      @errors[:phone] = 'Please enter a valid ten-digit phone number.'
    end
  end

  def validate_message
    if @message.nil? || @message.empty?
      @errors[:message] = 'Please enter a message.'
    end
  end
end
