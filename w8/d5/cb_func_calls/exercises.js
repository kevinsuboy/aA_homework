window.setTimeout(
    function(){
        alert('HAMMERTIME');
    },5000
);
function hammerTime(time){
    window.setTimeout(function(){
        alert(`${time} is hammertime!`);
    },time)
}
const readline = require('readline');
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
function teaAndBiscuits(){
    reader.question('Would you like some tea?',
        function(ans1){
            console.log(ans1);
            reader.question('Would you like some biscuits?',
                function(ans2){
                    console.log(`So you ${ans1} want tea and you ${ans2} want coffee`);
                    reader.close();
                }
            );
        }
    )
}
