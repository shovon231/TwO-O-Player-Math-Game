class Question
  attr_reader :text, :correct_answer

  def initialize
    @num1 = rand(1..20) # Generate a random number between 1 and 20
    @num2 = rand(1..20) # Generate another random number between 1 and 20
    @text = "What does #{@num1} plus #{@num2} equal?"
    @correct_answer = @num1 + @num2
  end

  def correct_answer?(answer)
    answer.to_i == @correct_answer
  end
end