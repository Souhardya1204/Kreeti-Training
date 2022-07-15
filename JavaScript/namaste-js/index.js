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
// let arr = ["Akshay","Aditya"]
// let obj = {
//     name:"Akshay",
//     city:"Dehradun",
//     getIntro: function(){
//         console.log(`${this.name} from ${this.city}`)
//     }
// }

// let obj2={
//     name:"Souhardya"
// }

// obj2.__proto__=obj

// let complete = false;
// let prom = new Promise( function(resolve, reject){
//   if(complete){
//     resolve("I am successful");
//   }
//   else{
//     reject("I am rejected");
//   }
// })

// function prom() {
//   return new Promise(function (resolve, reject) {
//     console.log("Fetching data ...");
//     setTimeout(() => {
//     $.get("https://jsonplaceholder.typicode.com/posts", (data)=>{
//       resolve(data)
//     }).fail( err => {
//       reject("Failed to fetch data")
//     })
//     }, 3000);
//   });
// }

// prom(9,0)
//   .then((result) => {
//     console.log(result);
//   })
//   .catch((error) => {
//     console.log(error);
//   });

// prom(false).catch(onrejection)

//promise.all

// let p1 = new Promise((resolve, reject)=>{
//   setTimeout(()=>{
//     console.log("First promise has resolved");
//     resolve(10);
//   }, 1*1000)
// })
// let p2 = new Promise((resolve, reject)=>{
//   setTimeout(()=>{
//     console.log("Second promise has resolved");
//     resolve(20);
//   }, 2*1000)
// })
// let p3 = new Promise((resolve, reject)=>{
//   setTimeout(()=>{
//     console.log("Third promise has resolved");
//     resolve(30);
//   }, 3*1000);
// })

// Promise.all([p1,p2,p3]).then(result =>{
//   var total = 0;
//   for(var i in result){
//     total = total + result[i]
//   }
//   console.log(result);
//   console.log(`Total = ${ total }`)
// }).catch( err =>{
//   console.log(err);
// })

// let test =async ()=> {
// return "hello"
// const response = await fetch("https://jsonplaceholder.typicode.com/posts")
// const posts = await response.json()
//   return await (await fetch("https://jsonplaceholder.typi1code.com/posts")).json()
// }

// test().then( result => {
//   console.log(result)
// }).catch( err => {
//   console.log( err )
// })

// fetch("content/readme.txt").then( (response) => {
//   console.log(response.text);
// })

// let counter = {
//   count: 0,
//   next: function () {
//     return ++this.count;
//   },
// };

// console.log(counter.next());
// console.log(this == window)
// function show() {
//   console.log(this === window); // true
// }

// show();
// let car = {
//   brand: 'Honda',
//   getBrand: function () {
//       return this.brand;
//   }
// }
// brand = "Hero"
// console.log(car.getBrand()); // Honda

// let brandfun = car.getBrand.bind(window);
// console.log(brandfun())
// function Car(brand) {
//   this.brand = brand;
// }

// Car.getBrand = function () {
//   return this.brand;
// }
// console.log( Car.prototype)
// // let car = new Car('Honda');
// // console.log(car.getBrand());
// // console.log (typeof Object)
// bike = {
//   brand: "Honda"
// }
// bike.__proto__.color = "Red"
// bike.horn = function(){
//   console.log("sound..")
// }
// console.log( Object.prototype)

// mobile = {}
// console.log(mobile.color)
// console.log(Car.prototype.__proto__.__proto__)

/* Classes are first class citizen */
// function factory(aClass) {
//   return new aClass();
// }
// let greeting = factory(class{
//   sayHi(){ console.log("Hi");}
// })

// console.log(greeting)
// greeting.sayHi()

/* Hoisting in Js*/

// getname()

// var getname = function getName(){
//   console.log("Namaste Js");
// }
// var x = 7;
// console.log(x)

/* How functions work in js */
// var x = 1;
// a();
// b();
// console.log(x);
// function a(){
//   var x = 10;
//   console.log(x);
// }

// function b(){
//   var x=100;
//   console.log(x);
// }

/**/
// var a = 100;
// let b = 50;

// {
//   let a = 10;/*shadowing as it showdows the value of outside a */
//   let b = 20;
//   const c = 30;
//   console.log(a);
//   console.log(b);
//   console.log(c);
// }
// console.log(a);
// console.log(b);
// console.log(c);

// function x(){
//   for(var i=1;i<=5;i++){
//     function y( p ){
//       setTimeout(function(){
//         console.log(p)
//       }, p*1000)
//     }
//     y(i);
//   }
// }

// x()

/* Data hiding using closures. Here counter variable cannot be accessed 
from global scope*/
// function outer() {
//   var counter = 0;
//   function myfunc() {
//     counter++;
//     console.log(counter);
//   }
//   return myfunc;
// }

// var count = outer();
// console.log(count)
// count()
// count()
// count()
// var count1 = outer()
// count1()
// count1()
// count1()
// count()

/* If I want to include decrementor then the above way is not right instead we can write constructor function */

// function Counter(){
//   var count = 0;
//   this.increMentor =   function increment() {
//                         count++;
//                         console.log(count);
//                       }
//   this.decreMentor = function decrement(){
//     count--;
//     console.log(count)
//   }
// }

// var c = new Counter()
// c.increMentor()
// c.increMentor()
// c.decreMentor()

/* Count how many number of times a button has been clicked */
function attachEventListeners() {
  let count = 0;
  document.getElementById("clickMe").addEventListener("click", function xyz() {
    console.log("Button clicked", ++count);
  });
}
attachEventListeners()