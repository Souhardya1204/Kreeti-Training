
// function a() {
//     var b = 10;
//     c();
//     function c() {
//         console.log(b);
//     }
// }

// a()


// function x(){
//     var a=7;
//     y();
//     function y(){
//         console.log(a);
//     }
//     a=100;
//     return y;
// }

// var z = x(); //here function in returned alongwith its lexical environment = function closure and y remembers it
// console.log(z);
// z();


// Inheritence in JS
let arr = ["Akshay","Aditya"]
let obj = {
    name:"Akshay",
    city:"Dehradun",
    getIntro: function(){
        console.log(`${this.name} from ${this.city}`)
    }
}

let obj2={
    name:"Souhardya"
}

obj2.__proto__=obj