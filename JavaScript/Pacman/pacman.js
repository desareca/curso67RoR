var world = [
    [92, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 86, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 93],
    [90, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 92, 91, 93, 50, 92, 91, 91, 93, 50, 90, 50, 92, 91, 91, 93, 50, 92, 91, 93, 50, 90],
    [90, 51, 90, 10, 90, 50, 90, 10, 10, 90, 50, 90, 50, 90, 10, 10, 90, 50, 90, 10, 90, 51, 90],
    [90, 50, 95, 91, 94, 50, 95, 91, 91, 94, 50, 99, 50, 95, 91, 91, 94, 50, 95, 91, 94, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 51, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 96, 91, 91, 97, 50, 98, 50, 96, 91, 86, 91, 97, 50, 98, 50, 96, 91, 91, 97, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 90, 50, 50, 50, 90, 50, 50, 50, 90, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 98, 50, 92, 93, 50, 88, 91, 97, 50, 99, 50, 96, 91, 89, 50, 92, 93, 50, 98, 50, 90],
    [90, 50, 99, 50, 95, 94, 51, 90, 50, 50, 50, 50, 50, 50, 50, 90, 51, 95, 94, 50, 99, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 90, 50, 92, 97, 85, 96, 93, 50, 90, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 92, 91, 91, 93, 50, 99, 50, 90, 85, 85, 85, 90, 50, 99, 50, 92, 91, 91, 93, 50, 90],
    [90, 50, 90, 10, 10, 90, 50, 50, 50, 90, 85, 85, 85, 90, 50, 50, 50, 90, 10, 10, 90, 50, 90],
    [90, 50, 95, 91, 91, 94, 50, 98, 50, 95, 91, 91, 91, 94, 50, 98, 50, 95, 91, 91, 94, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 90, 50, 50, 50, 51, 50, 50, 50, 90, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 92, 91, 91, 97, 50, 99, 50, 96, 91, 86, 91, 97, 50, 99, 50, 96, 91, 91, 93, 50, 90],
    [90, 50, 90, 50, 50, 50, 50, 50, 50, 50, 50, 90, 50, 50, 50, 50, 50, 50, 50, 50, 90, 50, 90],
    [90, 50, 90, 51, 96, 93, 50, 96, 91, 97, 50, 99, 50, 96, 91, 97, 50, 92, 97, 51, 90, 50, 90],
    [90, 50, 90, 50, 50, 90, 50, 50, 50, 50, 50, 10, 50, 50, 50, 50, 50, 90, 50, 50, 90, 50, 90],
    [90, 50, 95, 97, 50, 99, 50, 98, 50, 96, 91, 86, 91, 97, 50, 98, 50, 99, 50, 96, 94, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 90, 50, 50, 50, 90, 50, 50, 50, 90, 50, 50, 50, 50, 50, 50, 90],
    [90, 50, 96, 91, 91, 91, 91, 87, 91, 97, 50, 99, 50, 96, 91, 87, 91, 91, 91, 91, 97, 50, 90],
    [90, 50, 50, 50, 50, 50, 50, 51, 50, 50, 50, 50, 50, 50, 50, 51, 50, 50, 50, 50, 50, 50, 90],
    [95, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 94]
];

var rowWorld = world.length; // N° FILAS
var colWorld = world[0].length;; // N° COLUMNAS
var worldDict = {
    // estilos para fondo
    10: "blank",
    85: "blank", // blank ghost
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

// CUENTA COMIDA INICIAL
var c_cherry = 0; // N° INICIAL DE CHERRYS
var c_ball = 0; // N° INICIAL DE BALLS
for (var row = 0; row < rowWorld; row++) {
    for (var col = 0; col < colWorld; col++) {
        if (world[row][col] == 50) {
            c_ball++;
        }
        if (world[row][col] == 51) {
            c_cherry++;
        }
    }
}

// ASIGNACION DE VIDAS INICIAL DE PACMAN
var life_pacman = 3;

// CUENTA PUNTOS QUE HA COMIDO PACMAN
function countFood() {
    var count_c = 0;
    var count_b = 0;
    for (var row = 0; row < rowWorld; row++) {
        for (var col = 0; col < colWorld; col++) {
            if (world[row][col] == 51) {
                count_c++
            }
            if (world[row][col] == 50) {
                count_b++
            }
        }
    }
    return (50 * (c_cherry - count_c) + 10 * (c_ball - count_b))
}


// DIBUJA MAPA
function drawWorld() {
    var output = "";
    var ln = "";
    if (life_pacman > 0 || countFood() >= (50 * c_cherry + 10 * c_ball)) { //ASIGNA VIDA DE PACMAN A VARIABLE ln
        if (countFood() < (50 * c_cherry + 10 * c_ball)) {
            for (var im = 1; im <= life_pacman; im++) {
                ln = "<img src='pacman-1.gif' style='width: 28px; heigth: 28px; vertical-align: middle;'>" + ln;
            }
        }
        if (countFood() >= (50 * c_cherry + 10 * c_ball)) {
            ln = "WIN!!!"
        }
    } else { // SI VIDA <= 0, ASIGNA "GAME OVER!" A ln
        ln = "GAME OVER!"
    }

    for (var row = 0; row < rowWorld; row++) {
        output += "<div class = 'row'>"
        for (var x = 0; x < colWorld; x++) {
            output += "<div class = '" + worldDict[world[row][x]] + "'></div>"
        }
        output += "</div>"
    }
    output += "<div class = 'row'>" + "<div class = 'score'>" + "Score: " + countFood() + "</div>";
    output += "<div class = 'life'>" + ln + "</div>" + "</div>" + "</div>";
    document.getElementById('world').innerHTML = output;
}

// DEFINE POSICION INICIAL DE PACMAN
var pacman = {
    x: 11,
    y: 18
}

//DEFINE POSICION INICIAL DE FANTASMAS
// PUMPKY1
var pumpky1 = {
    y: 12,
    x: 11
}

// ASIGNA DIRECCION DE MOVIMIENTO INICIAL DE PACMAN
var direction = 1;

// DIBUJA PACMAN
function drawPacman() {
    document.getElementById('pacman').style.top = 30 * pacman.y + 'px'
    document.getElementById('pacman').style.left = 30 * pacman.x + 'px'
    document.getElementById('pacman').style.backgroundImage = "url('pacman-" + direction + ".gif')";
}

// PUMPKY
function drawPumpky() {
    document.getElementById('pumpky1').style.top = 30 * pumpky1.y + 'px'
    document.getElementById('pumpky1').style.left = 30 * pumpky1.x + 'px'
}


// MUEVE FANTASMAS (aleatorio)
// PUMPKY
var move_ini = 0;
var line_pumky = {
    y: [-1, -1, -1, 0, -1, -1, 0, -1, -1, 0, 0, 0],
    x: [0, 0, 0, 1, 0, 0, 1, 1, 0, 0, -1, -1]
}


function movePumpky() {
    if (life_pacman > 0 && countFood() < (50 * c_cherry + 10 * c_ball)) {
        if (move_ini < 12) {
            //pumpky1.y--;
            pumpky1.y += line_pumky.y[move_ini];
            pumpky1.x += line_pumky.x[move_ini];
            move_ini++;
        }
        if (move_ini >= 12) {
            var move = Math.floor(Math.random() * (3 + 1));
            if (move == 0 && (world[pumpky1.y][pumpky1.x - 1] < 85)) { //0 = LEFT
                pumpky1.x--;
            } else if (move == 1 && (world[pumpky1.y][pumpky1.x + 1] < 85)) { //1 = RIGHT
                pumpky1.x++;
            } else if (move == 2 && (world[pumpky1.y - 1][pumpky1.x] < 85)) { //2 = UP
                pumpky1.y--;
            } else if (move == 3 && (world[pumpky1.y + 1][pumpky1.x] < 85)) { //3 = DOWN
                pumpky1.y++;
            }
        }
    }
}

// INICIALIZA POSICION MUERTE NINJAMAN
function pacmanLife() {
    var pos_pumpky = pacman.y == pumpky1.y && pacman.x == pumpky1.x
    if (pos_pumpky) {
        life_pacman--;
        pacman.x = 11;
        pacman.y = 18;
    }
}

document.onkeydown = function(e) {
    if (life_pacman > 0 && countFood() < (50 * c_cherry + 10 * c_ball)) { // MUEVE A NINJAMAN MIENTRAS TENGA VIDAS
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
    }
}

function gameLoop() {
    pacmanLife()
    drawPacman()
    drawPumpky()
    movePumpky()
    drawWorld()
    setTimeout(gameLoop, 100)
}
gameLoop()