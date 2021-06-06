var world = [
    [92, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 86, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 93],
    [90, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 92, 91, 93, 50, 92, 91, 91, 93, 50, 90, 50, 92, 91, 91, 93, 50, 92, 91, 93, 50, 90],
    [90, 50, 90, 10, 90, 50, 90, 10, 10, 90, 50, 90, 50, 90, 10, 10, 90, 50, 90, 10, 90, 50, 90],
    [90, 50, 95, 91, 94, 50, 95, 91, 91, 94, 50, 99, 50, 95, 91, 91, 94, 50, 95, 91, 94, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 96, 91, 91, 97, 50, 98, 50, 96, 91, 86, 91, 97, 50, 98, 50, 96, 91, 91, 97, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 90, 50, 50, 50, 90, 50, 50, 50, 90, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 98, 50, 92, 93, 50, 88, 91, 97, 50, 99, 50, 96, 91, 89, 50, 92, 93, 50, 98, 50, 90],
    [90, 50, 99, 50, 95, 94, 50, 90, 50, 50, 50, 50, 50, 50, 50, 90, 50, 95, 94, 50, 99, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 90, 50, 92, 97, 10, 96, 93, 50, 90, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 92, 91, 91, 93, 50, 99, 50, 90, 10, 10, 10, 90, 50, 99, 50, 92, 91, 91, 93, 50, 90],
    [90, 50, 90, 10, 10, 90, 51, 50, 50, 90, 10, 10, 10, 90, 50, 50, 51, 90, 10, 10, 90, 50, 90],
    [90, 50, 95, 91, 91, 94, 50, 98, 50, 95, 91, 91, 91, 94, 50, 98, 50, 95, 91, 91, 94, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 90, 50, 50, 50, 51, 50, 50, 50, 90, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 92, 91, 91, 97, 50, 99, 50, 96, 91, 86, 91, 97, 50, 90, 50, 96, 91, 91, 93, 50, 90],
    [90, 50, 90, 50, 50, 50, 50, 50, 50, 50, 50, 90, 50, 50, 50, 50, 50, 50, 50, 50, 90, 50, 90],
    [90, 50, 90, 50, 96, 93, 50, 96, 91, 97, 50, 99, 50, 96, 91, 97, 50, 92, 97, 50, 90, 50, 90],
    [90, 50, 90, 50, 50, 90, 50, 50, 50, 50, 50, 10, 50, 50, 50, 50, 50, 90, 50, 50, 90, 50, 90],
    [90, 50, 95, 97, 50, 99, 50, 98, 50, 96, 91, 86, 91, 97, 50, 98, 50, 99, 50, 96, 94, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 90, 50, 50, 50, 90, 50, 50, 50, 90, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 96, 91, 91, 91, 91, 87, 91, 97, 50, 99, 50, 96, 91, 87, 91, 91, 91, 91, 97, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90],
    [95, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 94]
];

var rowWorld = world.length; // N° FILAS
var colWorld = world[0].length;; // N° COLUMNAS

var worldDict = {
    // estilos para fondo
    10: "blank",
    // Comida
    50: "ball",
    51: "cherry",
    // estilos para wall
    90: "wall1",
    91: "wall2",
    92: "wall3",
    93: "wall4",
    94: "wall5",
    95: "wall6",
    96: "wall7",
    97: "wall8",
    98: "wall9",
    99: "wall10",
    86: "wall11",
    87: "wall12",
    88: "wall13",
    89: "wall14"
}


// DIBUJA MAPA
function drawWorld() {
    var output = "";
    for (var row = 0; row < rowWorld; row++) {
        output += "<div class = 'row'>"
        for (var x = 0; x < colWorld; x++) {
            output += "<div class = '" + worldDict[world[row][x]] + "'></div>"
        }
        output += "</div>"
    }
    document.getElementById('world').innerHTML = output;
}
drawWorld();


// DEFINE POSICION INICIAL DE PACMAN
var pacman = {
    x: 11,
    y: 18
}

// ASIGNA DIRECCION DE MOVIMIENTO INICIAL DE PACMAN
var direction = 1;


// DIBUJA PACMAN
function drawPacman() {
    document.getElementById('pacman').style.top = 30 * pacman.y + 'px'
    document.getElementById('pacman').style.left = 30 * pacman.x + 'px'
    document.getElementById('pacman').style.backgroundImage = "url('pacman-" + direction + ".gif')";
}

drawWorld();
drawPacman();


document.onkeydown = function(e) {
    // if (life_pacman > 0) { // MUEVE A NINJAMAN MIENTRAS TENGA VIDAS
    if (e.keyCode == 37) { // LEFT
        direction = 2;
        if (world[pacman.y][pacman.x - 1] < 86) {
            pacman.x--;
        }
    } else if (e.keyCode == 39) { // RIGHT
        direction = 1;
        if (world[pacman.y][pacman.x + 1] < 86) {
            pacman.x++;
        }
    } else if (e.keyCode == 40) { // DOWN
        direction = 4;
        if (world[pacman.y + 1][pacman.x] < 86) {
            pacman.y++;
        }
    } else if (e.keyCode == 38) { // TOP
        direction = 3;
        if (world[pacman.y - 1][pacman.x] < 86) {
            pacman.y--;
        }
    }
    world[pacman.y][pacman.x] = 10;
    drawPacman()
    drawWorld()
}