function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        // var x = 'in block'; //! baaaddd
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    // let x = 'out of block again'; //! bad
    console.log(x);
}

function madLib(verb,adj,noun){
    console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`);
}
function isSubstring(searchString,subString){
    let words = searchString.split(" ");
    for(let i=0;i<words.length;i++){
        if(words[i] == subString) return true;
    }
    return false;
}

function fizzBuzz(arr){
    let new_arr = [];
    for(let i=0;i<arr.length;i++){
        if ((arr[i] % 3 === 0 && arr[i] % 5 !== 0) || (arr[i] % 3 !== 0 && arr[i] % 5 === 0)) new_arr.push(arr[i]);
    }
    return new_arr;
}

function isPrime(number){
    if (number <= 1) return false;
    for(let i=2;i<=number/2;i++){
        if(number%i === 0) return false;
    }
    return true;
}

function firstNPrimes(n){
    let primes = [];
    let i = 1;
    while(primes.length < n){
        if(isPrime(i)) primes.push(i);
        i++;
    }
    return primes;
}

function sumOfNPrimes(n){
    let primes = firstNPrimes(n);
    let sum = 0;
    for(let i=0; i<primes.length; i++){
        sum += primes[i];
    }
    return sum;
}

// mysteryScoping1()
// mysteryScoping2()
// mysteryScoping3()
// mysteryScoping4()
// mysteryScoping5()

// madLib("hit", "big","dog");

// console.log(isSubstring("time to program", "time"))
// console.log(isSubstring("Jump for joy", "joys"))

// console.log(fizzBuzz([1,4,6,7,5,3,2,4,4,3,5,5,1,15,30]))

// console.log(isPrime(2))
// console.log(isPrime(10))
// console.log(isPrime(15485863))
// console.log(isPrime(3548563))

// console.log(firstNPrimes(5));

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));

