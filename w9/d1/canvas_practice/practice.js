document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    const ctx = canvas.getContext('2d');
    // ctx.fillStyle = "red";
    // ctx.fillRect(100,100,10,10);
    ctx.beginPath();
    ctx.arc(50,50,50,0,Math.PI);
    ctx.lineWidth = 10;
    ctx.stroke();
    //
    ctx.fillStyle = "blue";
    ctx.fill();
});
