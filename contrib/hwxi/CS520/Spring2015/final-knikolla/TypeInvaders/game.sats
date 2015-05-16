(*
** SpaceInvaders
*)

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

#define PLAYER_X 304
#define PLAYER_Y 576

#define SCREEN_X 640
#define SCREEN_Y 640

#define ENEMY_ROWS 4
#define ENEMY_COLUMNS 8
#define ENEMY_SPACING 64
#define ENEMY_SPEED 4
#define ENEMY_SIZE 32
#define ENEMY_HALFSIZE 16
#define ENEMY_MAX_COOLDOWN 500

#define PLAYER_SIZE 32
#define PLAYER_HALFSIZE 16
#define PLAYER_SPEED 20
#define PLAYER_COOLDOWN 1000

#define KEY_LEFT 37
#define KEY_RIGHT 39
#define KEY_UP 38
#define KEY_DOWN 40

#define BULLET_SIZE 4
#define BULLET_HALFSIZE 2
#define BULLET_SPEED 16

// Game Object
abstype gameobject
abstype store

// Init
fun init_stage(): void = "mac#"
fun init_resources(): void = "mac#"

// Stage
fun stage_add(gameobject): void = "mac#"
fun stage_remove(gameobject): void = "mac#"
fun stage_update(): void = "mac#"

// Game Object
fun gameobject_get_x (gameobject): int = "mac#"
fun gameobject_set_x (gameobject, x: int): void = "mac#"
fun gameobject_get_y (gameobject): int = "mac#"
fun gameobject_set_y (gameobject, y: int): void = "mac#"
fun gameobject_translate (gameobject, hsize: int, dx: int, dy: int): void = "mac#"

overload .x with gameobject_get_x
overload .x with gameobject_set_x
overload .y with gameobject_get_y
overload .y with gameobject_set_y
overload .translate with gameobject_translate

// Store
fun store_init(): store = "mac#"
fun store_add(store, gameobject): void = "mac#"
fun store_get(store, intGte(0)): gameobject = "mac#"
fun store_remove(store, int): void = "mac#"
fun store_size(store): intGte(0) = "mac#"

overload .add with store_add
overload .get with store_get
overload .remove with store_remove
overload .size with store_size

// Others
fun object_store_collision{n:nat}(g: gameobject, gs: int, s: store, ss: int, n: int(n)): int ="mac#"
fun check_collision(gameobject, hsize_a: int, gameobject, hsize_b: int): int = "mac#"


// Player
fun init_player(x: intGte(0), y: intGte(0)): gameobject = "mac#"
fun player_get(): Option(gameobject)
fun player_remove(): void = "mac#"

fun player_update(p: gameobject, dt: int): void = "mac#"
fun player_cooldown(dt: int): void = "mac#"
fun player_can_fire(): Option(int) = "mac#"
fun player_input(gameobject): void = "mac#"
fun player_fire(gameobject): void = "mac#"
fun player_create_bullet(p: gameobject): gameobject = "mac#"
fun player_death(gameobject): void = "mac#"

// Enemy
fun init_enemies{x,y:pos}(s: store, cols: int(x), rows: int(y)): void = "mac#"
fun enemies_get(): store = "mac#"
fun enemy_create(x: intGte(0), y: intGte(0)): gameobject = "mac#"
fun enemy_update(dt: intGte(0)): void = "mac#"
fun enemy_can_fire(dt: intGte(0)): Option(int) = "mac#"
fun enemy_create_bullet(gameobject): gameobject = "mac#"

fun enemies_direction(): int = "mac#"
fun enemies_turn(): void = "mac#"

// Bullets
fun player_bullets_get(): store = "mac#"
fun enemy_bullets_get(): store = "mac#"

fun player_bullets_update(dt: intGte(0)): void = "mac#"
fun enemy_bullets_update(dt: intGte(0)): void = "mac#"

// Game
fun game_tick(dt: intGte(0)): void = "mac#"
fun check_key(key: intGte(0)): int = "mac#"
fun my_rand(intGte(0)): intGte(0) = "mac#"

fun gameover_alert(): void = "mac#"
fun congrats_alert(): void = "mac#"
