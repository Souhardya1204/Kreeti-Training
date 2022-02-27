class Question
    attr_accessor :prompt, :answer
    def initialize(prompt,answer)
        @prompt = prompt
        @answer=answer
    end
end

p1="What is the capital of India? \n a) Mumbai \n b)New Delhi \n c)Kolkata"
p2="What is the capital of India? \n a) Mumbai \n b)New Delhi \n c)Kolkata"
p3="What is the capital of India? \n a) Mumbai \n b)New Delhi \n c)Kolkata"
questions=[Question.new(p1,"b"),Question.new(p1,"b"),Question.new(p1,"b")]

def quiz(questions)
    count=0
    for question in questions do
        puts question.prompt
        ans=gets.chomp()
        if(ans==question.answer)
            count+=1
        end
    end
    return count
end

score = quiz(questions)
puts("You got "+score.to_s+" out of "+ questions.length().to_s)