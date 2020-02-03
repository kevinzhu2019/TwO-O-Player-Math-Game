class Questions

  attr_accessor :answer, :display

  def initialize
    @num1 = 1 + rand(20) # +1 is for a random integer!
    @num2 = 1 + rand(20)
    @answer = @num1 + @num2
    @display = "What does #{@num1} plus #{@num2} equal?"
  end

end