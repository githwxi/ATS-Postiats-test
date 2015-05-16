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
staload "./game.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

local
  val player = ref(None)
  val p_cooldown = ref{int}(0)

  val e = store_init()
  val enemies = ref{store}(e)
  val e_cooldown = ref{int}(2000)

  val pb = store_init()
  val player_bullets = ref{store}(pb)

  val eb = store_init()
  val enemy_bullets = ref{store}(eb)

  val e_dir = ref{int}(1)


  fun init(): void =
  {
    // Init Game
    val () = init_stage()
    val () = init_resources()

    // Init Player
    val p = init_player(PLAYER_X, PLAYER_Y)
    val () = stage_add(p)
    val () = player[] := Some(p)

    val () = init_enemies(e, ENEMY_COLUMNS, ENEMY_ROWS)
  }

  implement player_get() = player[]

  implement enemies_get() = enemies[]
  implement player_bullets_get() = player_bullets[]
  implement enemy_bullets_get() = enemy_bullets[]

  implement enemies_direction() = e_dir[]
  implement enemies_turn() =
    let
      val () = e_dir[] := ~1 * e_dir[]
    in
      ()
    end

  implement player_remove() =
    let
      val () = player[] := None()
    in
      ()
    end

  implement player_cooldown(dt) =
    if p_cooldown[] > 0 then
      p_cooldown[] := p_cooldown[] - dt

  implement player_can_fire() =
    if p_cooldown[] <= 0 then
      let
        val() =  p_cooldown[] := PLAYER_COOLDOWN
      in
        Some(1)
      end
    else None()

  implement enemy_can_fire(dt) =
    let
      val () = e_cooldown[] := e_cooldown[] - dt
    in
      if e_cooldown[] < 0 then
        let
          val e = enemies_get()
          val n = e.size()
          val () = e_cooldown[] := my_rand(ENEMY_MAX_COOLDOWN) * (n/4 + 1)
        in
          Some(1)
        end
      else None()
    end

in
  val () = init()
end

implement init_enemies{x,y}(s, x, y) =
  let
    fun go{x,y:nat}
      (s: store, x:int(x), y: int(y), i: natLt(x), j: natLt(y)): void =
      let
        val ex = ENEMY_SPACING * (i + 1)
        val ey = ENEMY_SPACING * (j + 1)
        val e = enemy_create(ex, ey)
        val () = stage_add(e)
        val () = s.add(e)
      in
        if i + 1 < x  then go(s, x, y, i + 1, j)
        else
          if j + 1 < y then go(s, x, y, 0, j + 1)
          else ()
      end
  in
    go(s, x, y, 0, 0)
  end

implement player_death(p) =
  let
    val () = player_remove()
    val () = stage_remove(p)
    val () = gameover_alert()
  in
    ()
  end

implement game_tick(dt) =
  let
    val opt = player_get()
  in
    case opt of
    | None() => ()
    | Some(p) =>
      let
        val () = enemy_update(dt)
        val () = player_update(p, dt)
        val () = player_bullets_update(dt)
        val () = enemy_bullets_update(dt)
      in
        stage_update()
      end
  end

implement enemy_update(dt) =
  let
    fun boundaries{n:pos}(s: store, n: int(n), i: natLt(n)): void =
      let
        fun check(x: int): int =
          if x >= SCREEN_X - ENEMY_HALFSIZE || x <= ENEMY_HALFSIZE then
            let
              val () = enemies_turn()
            in
              1
            end
          else 0

        val e = s.get(i)
        val x = e.x()
        val c = check(x)
      in
        if c = 1 then ()
        else
          if i + 1 < n then boundaries(s, n, i + 1)
          else ()
      end

    fun shoot{n:pos}(s: store, n:int(n), dt: intGte(0)): void =
      let
        val t = enemy_can_fire(dt)
      in
        case t of
        | None() => ()
        | Some(x) =>
          let
            val i = my_rand(n - 1)
            val e = s.get(i)
            val b = enemy_create_bullet(e)
            val bs = enemy_bullets_get()
            val () = bs.add(b)
            val () = stage_add(b)
          in () end
      end

    fun move{n:pos}(s: store, n: int(n), i: natLt(n), d: int): void =
      let
        val e = s.get(i)
        val () = e.translate(ENEMY_HALFSIZE, ENEMY_SPEED * d, 0)
      in
        if i + 1 < n then move(s, n, i + 1, d)
        else ()
      end

    val e = enemies_get()
    val s = e.size()
  in
    if s > 0 then
      let
        val () = boundaries(e, s, 0)
        val d = enemies_direction()
        val () = shoot(e, s, dt)
      in
        move(e, s, 0, d)
      end
    else ()
  end

implement player_input(p) =
{
  val () =
    if check_key(KEY_LEFT) = 1 then
      p.translate(PLAYER_HALFSIZE, ~PLAYER_SPEED, 0)

  val () =
    if check_key(KEY_RIGHT) = 1 then
      p.translate(PLAYER_HALFSIZE, PLAYER_SPEED, 0)

  val () =
    if check_key(KEY_UP) = 1 then
      player_fire(p)
}

implement player_fire(p) =
  let
    val t = player_can_fire()
  in
    case t of
    | None() => ()
    | Some(i) =>
      {
        val bs = player_bullets_get()
        val b = player_create_bullet(p)
        val () = stage_add(b)
        val () = bs.add(b)
      }
  end

implement player_update(p, dt) =
{
  val () = player_cooldown(dt)
  val () = player_input(p)

  val b = enemy_bullets_get()
  val n = b.size()
  val i = object_store_collision(p, PLAYER_HALFSIZE, b, BULLET_HALFSIZE, n)

  val () = if i > 0 then player_death(p)
}

implement player_bullets_update(dt) =
  let
    fun move{n:pos}(s: store, n: int(n), i: natLt(n)): void =
      let
        val e = s.get(i)
        val () = e.translate(BULLET_HALFSIZE, 0, ~BULLET_SPEED)
        val () =
          if e.x() + BULLET_HALFSIZE < 0 then s.remove(i)

        val es = enemies_get()
        val en = es.size()
        val co = object_store_collision
          (e, BULLET_HALFSIZE, es, ENEMY_HALFSIZE, en)
        val () =
          if co = 1 then
          {
            val () = s.remove(i)
            val () = stage_remove(e)
            val () = if en = 1 then congrats_alert()
          }
      in
        if i > 0 then move(s, n, i - 1)
        else ()
      end

    val s = player_bullets_get()
    val e = enemies_get()
    val n = s.size()
  in
    if n > 0 then move(s, n, n - 1)
    else ()
  end

implement enemy_bullets_update(dt) =
  let
    fun move{n:pos}(s: store, n: int(n), i: natLt(n)): void =
      let
        val e = s.get(i)
        val () = e.translate(BULLET_HALFSIZE, 0, BULLET_SPEED)
        val () =
          if e.x() - BULLET_HALFSIZE > SCREEN_Y then s.remove(i)
      in
        if i > 0 then move(s, n, i - 1)
        else ()
      end

    val s = enemy_bullets_get()
    val n = s.size()
  in
    if n > 0 then move(s, n, n - 1)
    else ()
  end

implement object_store_collision(g, gs, s, ss, n) =
  let
    fun go{n:pos}
    (g: gameobject, gs: int, s: store, ss: int, n: int(n), i: natLt(n)): int =
      let
        val e = s.get(i)
        val r = check_collision(g, gs, e, ss)
      in
        if r = 1 then
          let
            val () = stage_remove(e)
            val () = s.remove(i)
          in
            1
          end
        else
          if i > 0 then go(g, gs, s, ss, n, i - 1)
        else 0
      end
  in
    if n > 0 then go(g, gs, s, ss, n, n - 1)
    else 0
  end

implement check_collision(a, hsize_a, b, hsize_b) =
  let
    val a_left = a.x() - hsize_a
    val a_right = a.x() + hsize_a
    val a_top = a.y() + hsize_a
    val a_bottom = a.y() - hsize_a

    val b_left = b.x() - hsize_b
    val b_right = b.x() + hsize_b
    val b_top = b.y() + hsize_b
    val b_bottom = b.y() - hsize_b
  in
    if
      a_right < b_left ||
      a_left > b_right ||
      a_top < b_bottom ||
      a_bottom > b_top  then 0
    else 1
  end

implement gameobject_translate(g, hsize, x, y) =
{
  val () =
    if x > 0 then
      if g.x() + x + hsize > SCREEN_X then
        gameobject_set_x(g, SCREEN_X - hsize)
      else gameobject_set_x(g, g.x() + x)
    else
      if g.x() + x < hsize then
        gameobject_set_x(g, hsize)
      else gameobject_set_x(g, g.x() + x)

  val () = gameobject_set_y(g, g.y() + y)
}

(* ****** ****** *)

%{$
//
function
game_start()
{
  var _ = my_dynload()
}
//
%}

(* end of [mygame.dats] *)
