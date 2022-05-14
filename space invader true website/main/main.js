
const RIGHT_KEY = 39;
const LEFT_KEY = 37;
const SPACE_KEY = 32;

const GAME_WIDTH = 800;
const GAME_HEIGHT = 600;

const STATE = {
  x_position : 0,
  y_position : 0,
  moving_right: false,
  moving_left: false,
  shooting: false,
  lasers: [],
  enemyLasers: [],
  enemies_ship : [],
  spaceship_width: 50,
  enemy_width: 50,
  cooldown : 0,
  number_of_enemies: 14,
  enemy_cooldown : 0,
  gameOver: false
}

// General functions   
function setPosition($element, x, y) {
  $element.style.transform = `translate(${x}px, ${y}px)`;
}

function setSize($element, width) {
  $element.style.width = `${width}px`;
  $element.style.height = "auto";
}
// game boundary to not allow to player to go left and right 
function boundaries(x){
  if (x >= GAME_WIDTH-STATE.spaceship_width){
    STATE.x_position = GAME_WIDTH-STATE.spaceship_width;
    return GAME_WIDTH-STATE.spaceship_width
  } if (x <= 0){
    STATE.x_position = 0;
    return 0
  } else {
    return x;
  }
}

function collisions(rect1, rect2){
  return!(rect2.left > rect1.right || 
    rect2.right < rect1.left || 
    rect2.top > rect1.bottom || 
    rect2.bottom < rect1.top);
}

// create the enemy and set their postion load up png image 
function EnemyMade($container, x, y){
  const $enemy = document.createElement("img");
  $enemy.src = "img/ufo.png";
  $enemy.className = "enemy";
  $container.appendChild($enemy);
  const enemy_cooldown = Math.floor(Math.random()*420);
  const enemy = {x, y, $enemy, enemy_cooldown}
  STATE.enemies_ship.push(enemy);
  setSize($enemy, STATE.enemy_width);
  setPosition($enemy, x, y)
}
// enemy will have a random cooldown on when to shoot the laser'
//also moves the enemies ship in a circualr motion 
function updateEnemies($container){
  const dx = Math.sin(Date.now()/1000)*40;
  const dy = Math.cos(Date.now()/1000)*30;
  const enemies_ship = STATE.enemies_ship;
  for (let i = 0; i < enemies_ship.length; i++){
    const enemy = enemies_ship[i];
    var a = enemy.x + dx;
    var b = enemy.y + dy;
    setPosition(enemy.$enemy, a, b);
    //enemy laser cooldown random cooldown everytime for enemy ships to shoot
    enemy.cooldown = Math.random(0,500);
    if (enemy.enemy_cooldown == 0){
      createEnemyLaser($container, a, b); 
      enemy.enemy_cooldown = Math.floor(Math.random()*50)+200 ;
    } 
    //reduce enemy ship cooldown until back to to triger another shot
    enemy.enemy_cooldown -= .5;
  }
}

// to have the postion centered on the game canvas as well as load th
function createShip($container) {
  STATE.x_position = GAME_WIDTH / 2;
  STATE.y_position = GAME_HEIGHT - 50;
  const $ship = document.createElement("img");
  $ship.src = "img/spaceship.png";
  $ship.className = "ship";
  $container.appendChild($ship);
  setPosition($ship, STATE.x_position, STATE.y_position);
  setSize($ship, STATE.spaceship_width);
}
//update the movement of the player if the key of left or right is true 
function updatePlayer(){
  if(STATE.moving_left){
    STATE.x_position -= 3;
  } if(STATE.moving_right){
    STATE.x_position += 3;
  } if(STATE.shooting && STATE.cooldown == 0){
    createLaser($container, STATE.x_position - STATE.spaceship_width/2, STATE.y_position);
    STATE.cooldown = 40;
  }
  const $ship = document.querySelector(".ship");
  setPosition($ship, boundaries(STATE.x_position), STATE.y_position-10);
  if(STATE.cooldown > 0){
    STATE.cooldown -= 0.5;
    //coodldown is decreased everytime this function is called, cooddown set to 40 until back to 0 to allow user to shoot again
  }
}

// create player laser and set it on postion of player, as well set to array 
function createLaser($container, x, y){
  const $laser = document.createElement("img");
  $laser.src = "img/laser.png";
  $laser.className = "laser";
  $container.appendChild($laser);
  const laser = {x, y, $laser};
  STATE.lasers.push(laser);
  const audio = new Audio("img/laser.ogg");
  audio.play();
  setPosition($laser, x, y);
}
//this function will move the from the const array, and them move the laser updwards by subtractring from y coords
function updateLaser($container){
  const lasers = STATE.lasers;
  for(let i = 0; i < lasers.length; i++){
    const laser = lasers[i];
    laser.y -= 2;
    if (laser.y < 0){
      LaserRemoved(lasers, laser, laser.$laser);
    }
    setPosition(laser.$laser, laser.x, laser.y);
    //for loop to remove the enemy and laser if they move collide with one another
    const laser_hitbox = laser.$laser.getBoundingClientRect();
    const enemies_ship = STATE.enemies_ship;
    for(let j = 0; j < enemies_ship.length; j++){
      const enemy = enemies_ship[j];
      const enemy_hitbox = enemy.$enemy.getBoundingClientRect();
      if(collisions(enemy_hitbox, laser_hitbox)){
        LaserRemoved(lasers, laser, laser.$laser);
        const index = enemies_ship.indexOf(enemy);
        enemies_ship.splice(index,1);
        $container.removeChild(enemy.$enemy);
        const audio = new Audio("img/laserEX.ogg");
    audio.play();
      }
    }
  }
}
 
// Create the laser for the enemy function 
function createEnemyLaser($container, x, y){
  const $enemyLaser = document.createElement("img");
  $enemyLaser.src = "img/laser1.png";
  $enemyLaser.className = "enemyLaser";
  $container.appendChild($enemyLaser);
  const enemyLaser = {x, y, $enemyLaser};
  STATE.enemyLasers.push(enemyLaser);
  setPosition($enemyLaser, x, y);
}
//move the enemy laser downards in constant downward motion 
function updateEnemyLaser($container){
  const enemyLasers = STATE.enemyLasers;
  for(let i = 0; i < enemyLasers.length; i++){
    const enemyLaser = enemyLasers[i];
    enemyLaser.y += 2;

    //delete the enemy laser if it moves outside game window 
  //this also triggers game over state if enemy laser hitbox collides with the player hitbox
    if (enemyLaser.y > GAME_HEIGHT-30){
      LaserRemoved(enemyLasers, enemyLaser, enemyLaser.$enemyLaser);
    }
    const enemyLaser_hitbox = enemyLaser.$enemyLaser.getBoundingClientRect();
    const spaceship_hitbox = document.querySelector(".ship").getBoundingClientRect();
    if(collisions(spaceship_hitbox, enemyLaser_hitbox)){
      STATE.gameOver = true;
    }
    setPosition(enemyLaser.$enemyLaser, enemyLaser.x + STATE.enemy_width/2, enemyLaser.y+15);
  }
}

// to remove the laser from game
function LaserRemoved(lasers, laser, $laser){
  const index = lasers.indexOf(laser);
  lasers.splice(index,1);
  $container.removeChild($laser);
}

// Key Presses
function KeyIsPressed(event) {
  if (event.keyCode === RIGHT_KEY) {
    STATE.moving_right = true;
  } else if (event.keyCode === LEFT_KEY) {
    STATE.moving_left = true;
  } else if (event.keyCode === SPACE_KEY) {
    STATE.shooting = true;
  }
}
// of the key is no longer pressed 
function KeyIsReleased(event) {
  if (event.keyCode === RIGHT_KEY) {
    STATE.moving_right = false;
  } else if (event.keyCode === LEFT_KEY) {
    STATE.moving_left = false;
  } else if (event.keyCode === SPACE_KEY) {
    STATE.shooting = false;
  }
}

// where the upates take place as well as win or lose statements to stop the game
function update(){

  
  if (STATE.gameOver) {
    const audio = new Audio("img/lose.ogg");
    audio.play();
    document.querySelector(".lose").style.display = "block"
    return;
  } if (STATE.enemies_ship.length == 0) {
    const audio = new Audio("img/win.ogg");
    audio.play();
    document.querySelector(".win").style.display = "block";
    return;
  }
  updatePlayer();
  updateEnemies($container);
  updateLaser($container);
  updateEnemyLaser($container);

  window.requestAnimationFrame(update);
}
//this will create the enemies in two rows , 80 is x and 100 is y, 
//second row of enemies will fall in 180 y axis

function createEnemies($container) {
  for(var i = 0; i <= STATE.number_of_enemies/2; i++){
    EnemyMade($container, i*80, 100);
  } for(var i = 0; i <= STATE.number_of_enemies/2; i++){
    EnemyMade($container, i*80, 180);
  }
}

// where the game is intialzied 
const $container = document.querySelector(".main");
createShip($container);
createEnemies($container);
 
window.addEventListener("keydown", KeyIsPressed);
window.addEventListener("keyup", KeyIsReleased);
update();