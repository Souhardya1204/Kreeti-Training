var arr = [1,2,3,4,5];
var doublearr = arr.map(function(i){
    return 2*i;
})

var sum = arr.reduce(function(sum,i){
    return sum+i;
})
console.log(doublearr)