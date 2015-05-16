// Global Constants
var SCREEN_X = 640;
var SCREEN_Y = 640;

var PLAYER_SIZE = 32;
var PLAYER_HALFSIZE = PLAYER_SIZE / 2;
var PLAYER_SPEED = 20;
var PLAYER_COOLDOWN = 1000;

var BULLET_SIZE = 4;
var BULLET_HALFSIZE = BULLET_SIZE / 2;
var BULLET_SPEED = 16;

var ENEMY_ROWS = 4;
var ENEMY_COLUMNS = 8;
var ENEMY_SPACING = 64;
var ENEMY_SPEED = 2;
var ENEMY_SIZE = 32;
var ENEMY_HALFSIZE = ENEMY_SIZE / 2;
var ENEMY_MAX_COOLDOWN = 300;

// Global Variables
var stage;
var keys = {};

// Resources
var imageSpaceship = new Image();
var spritesSpaceship;

var imageAlien = new Image();
var spritesAlien;

function my_rand(i) {
    return Math.round(i * Math.random());
}

// Stage
function stage_add(gameobject) {
    stage.addChild(gameobject);
}

function stage_remove(gameobject) {
    stage.removeChild(gameobject);
}

function stage_update() {
    stage.update();
}

// Game Object
function gameobject_get_x(gameobject, x) {
    return gameobject.x;
}

function gameobject_get_y(gameobject, y) {
    return gameobject.y;
}

function gameobject_set_x(gameobject, x) {
    gameobject.x = x;
}

function gameobject_set_y(gameobject, y) {
    gameobject.y = y;
}

// Store
function store_init() {
    return [];
}

function store_add(store, o) {
    store.push(o);
}

function store_get(store, i) {
    return store[i];
}

function store_remove(store, i) {
    store.splice(i, 1);
}

function store_size(store) {
    return store.length;
}

function init_stage() {
    stage = new createjs.Stage("gameCanvas");
    console.log("Init Stage");
    createjs.Ticker.addEventListener("tick", tick);
    this.document.onkeydown = keyDown;
    this.document.onkeyup = keyUp;
}

function init_resources() {
    imageSpaceship.src = "images/spaceship.png";
    imageAlien.src = "images/alien1.png";

    spritesSpaceship = new createjs.SpriteSheet({
        images: [imageSpaceship],
        frames: {
          width: 32, height: 32, regX: 16, regY: 16
        },
        animations: {
          walk: [0, 2, "idle"]
        }
    });

    spritesAlien = new createjs.SpriteSheet({
        images: [imageAlien],
        frames: {
          width: 32, height: 32, regX: 16, regY: 16
        },
        animations: {
          walk: [0, 3, "idle"]
        }
    });
}

function init_player(x, y) {
    player = new createjs.BitmapAnimation(spritesSpaceship);
    player.gotoAndPlay("idle");
    player.currentFrame = 0;
    player.x = x;
    player.y = y;

    return player;
}

function enemy_create(x, y) {
    var enemy = new createjs.BitmapAnimation(spritesAlien);
    enemy.gotoAndPlay("idle");
    enemy.currentFrame = 0;
    enemy.x = x;
    enemy.y = y;

    return enemy;
}

function player_create_bullet(p) {
    var x = p.x;
    var y = p.y;

    var bullet = new createjs.Shape();
    bullet.graphics.beginFill("red").drawCircle(0, 0, BULLET_SIZE);
    bullet.x = x;
    bullet.y = y - (PLAYER_HALFSIZE + BULLET_SIZE / 2);

    return bullet;
}

function enemy_create_bullet(enemy) {
    var bullet = new createjs.Shape();
    bullet.graphics.beginFill("blue").drawCircle(0, 0, BULLET_SIZE);
    bullet.x = enemy.x;
    bullet.y = enemy.y + (ENEMY_HALFSIZE + BULLET_SIZE / 2);
    return bullet;
}

function tick(updateEvent) {
    game_tick(updateEvent.delta);
}

function check_key(key) {
    if (keys[key])   return 1;
    else return 0;
}

function keyDown(event) {
    keys[event.keyCode] = true;
}

function keyUp(event) {
    delete keys[event.keyCode];
}

function gameover_alert() {
    alert("Game Over!");
}

function congrats_alert() {
    alert("Congratulations!");
}

