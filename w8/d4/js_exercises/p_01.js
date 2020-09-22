//! phase 1
function titleize(arr,cb){
    let new_arr = arr.map(
        el => `Mx. ${el} Jingleheimer Schmidt`
    )
    return cb(new_arr);
}

titleize(["Mary", "Brian", "Leo"], (arr)=>{arr.forEach(el=>console.log(el))}) //?

//! phase 2

function Elephant(name, height, tricks){
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}
Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!`);
}
Elephant.prototype.grow = function() {
    this.height += 12;
}
Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick)
}
Elephant.prototype.play = function(){
    let i = Math.floor(Math.random() * this.tricks.length);
    console.log(`${this.name} is ${this.tricks[i]}`)
}

// let ellie = new Elephant('Ellie', 54);
//! Phase 3
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
ellie.trumpet();
ellie.grow();
ellie.addTrick("farting");
ellie.play();
console.log(ellie.height);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elObj) {
    console.log(`${elObj.name} is trotting by`);
}
herd.forEach(
    el => Elephant.paradeHelper(el)
)

//! phase 4
function dinerBreakfast(){
    let foods = "cheesy scrambled eggs";
    console.log(foods);
    return function(food){
        foods += ` and ${food}`;
        console.log(`I'd like ${foods} please.`)
    }
}
let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");