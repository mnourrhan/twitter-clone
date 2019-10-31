class User

  #  Support by default setter and getter methods for user attributes
  attr_accessor :name, :email

  # any variable start with @ is instance variable and it will be available into class and view
  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name}  <#{@email}>"
  end
end
