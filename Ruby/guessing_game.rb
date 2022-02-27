secret_word="giraffe"
guess=""
guess_limit=4
char=1
score=nil
while char<=4
    puts("Guess the "+secret_word.length().to_s+" letter word starting with "+ secret_word[0,char]+" :")
    guess=gets.chomp()
    if(guess==secret_word)
        puts "You Won. "
        score=20-((char-1)*5)
        puts("Your score "+ score.to_s ) 
        break
    end
    char+=1
end

if(score==nil)
    puts("You loose")
    puts("Correct answer is "+secret_word)
end


