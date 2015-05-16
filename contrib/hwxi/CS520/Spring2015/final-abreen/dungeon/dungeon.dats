#include "share/atspre_staload.hats"

#define BOLD "\033[1m"
#define NO_BOLD "\033[22m"

#define NORTH 0
#define EAST 1
#define SOUTH 2
#define WEST 3

staload UN = "prelude/SATS/unsafe.sats"

staload "dungeon.sats"

#include "exitstable.hats"
#include "fileformat.hats"


fun direction_index(dir: Direction): natLt(4) =
  case+ dir of
  | North () => NORTH
  | East () => EAST
  | West () => WEST
  | South () => SOUTH

(*********************************************************
 * Printing representations of data structures
 *********************************************************)
fun print_dir (dir: Direction): void =
  case dir of
  | North () => print("north")
  | East () => print("east")
  | West () => print("west")
  | South () => print("south")

fun print_key (key: Key): void =
  let
    val () = print("Key('")
    val () = print(key.description)
    val () = print("', ")
    val () = print(tostring_val<int>(key.secret))
    val () = print(")")
  in () end

fun print_space_short (space: Space): void =
  case space of
  | Room (id, name, _) => (print(id); print(" "); print(name))
  | Door (id, name, _, _) => (print(id); print(" "); print(name))
  | Empty () => print("~")

fun print_space (space: Space): void =
  case space of
  | Room (id, name, desc) => (
      let
        val () = print($UN.cast{ptr}(space))
        val () = print(" Room('")
        val () = print(name)
        val () = print("', '")
        val () = print(desc)
        val () = print("'")
      in () end
    )
  | Door (id, name, desc, _) => (
      let
        val () = print("Door('")
        val () = print(name)
        val () = print("', '")
        val () = print(desc)
        val () = print("')")
      in () end
    )
  | Empty () => print("~")

fun print_player (player: Player): void =
  let
    val () = print("Player('")
    val () = print(player.name)
    val () = print("', ")
    val () = print_space(player.location)
    val () = print(")")
  in () end

fun print_item (item: Item): void =
  let
    val () = print("Item('")
    val () = print(item.name)
    val () = print("', '")
    val () = print(item.description)
    val () = print("', ")
    val () = print_space(item.location)
    val () = print(")")
  in () end

overload print with print_dir
overload print with print_key
overload print with print_space
overload print with print_player
overload print with print_item


(*********************************************************
 * Printing "descriptions" in the game
 *********************************************************)
symintr describe

fun describe_dir (dir: Direction): void =
  let
    val d: string = (
      case dir of
      | North () => "north"
      | East () => "east"
      | West () => "west"
      | South () => "south"
    )
    val () = print("to the ")
    val () = print_string(d)
  in () end

fun describe_key (key: Key): void = print_string(key.description)

fun describe_space (space: Space): void =
  case space of
  | Room (_, name, desc) => (
      print_string(BOLD);
      println!(name);
      print_string(NO_BOLD);
      print_string(desc);
      println!()
    )
  | Door (_, name, desc, _) => (
      print_string(BOLD);
      println!(name);
      print_string(NO_BOLD);
      print_string(desc);
      println!()
    )
  | Empty () => $raise DESCRIBING_EMPTY

fun describe_item (item: Item): void = print_string(item.description)

overload describe with describe_dir
overload describe with describe_key
overload describe with describe_space
overload describe with describe_item


(*********************************************************
 * Player & movement functions
 *********************************************************)
fun spawn_player (name: string, loc: Space): Player =
  case loc of
  | Empty() => $raise BAD_SPAWN
  | _ => @{name=name, location=loc}

fun exit_in_direction(exits: list(Space, 4), dir: Direction): bool =
  let
    val dest = exits[direction_index(dir)]
  in
    case dest of
    | Empty () => false
    | _ => true
  end

fun get_exit(exits: list(Space, 4), dir: Direction): Space =
  exits[direction_index(dir)]


(*********************************************************
 * Handling commands typed by the player
 *********************************************************)
datatype Command =
  | Move of (Direction)
  | Exits
  | Quit
  | Invalid of (string)

fun prompt (): [n: int | n > 0] string(n) =
  let
    fun loop (): [n: int | n > 0] string(n) =
      let
        val not_eof = fileref_isnot_eof(stdin_ref)
      in
        if not_eof then
          let
            val () = print("> ")
            val line = fileref_get_line_string(stdin_ref)
            val str = strptr2string(line)
            val len = string1_length(str)
          in
            if len <= 0 then loop()
            else str
          end
        else "quit"     // got EOF; return "quit"
      end
  in loop() end         // starting loop

fun get_command {n: int | n > 0} (cmd: string(n)): Command =
  let
    val first = cmd[0]
  in
    case first of
    | 'n' => Move(North)
    | 'e' => Move(East)
    | 's' => Move(South)
    | 'w' => Move(West)
    | 'x' => Exits
    | 'q' => Quit
    | _ => Invalid(cmd)
  end

fun print_exits(exits: list(Space, 4)): void =
  begin
    print("Ways out: ");
    (
      case exits[NORTH] of
      | Empty () => ()
      | _ => print("north ")
    );
    (
      case exits[EAST] of
      | Empty () => ()
      | _ => print("east ")
    );
    (
      case exits[SOUTH] of
      | Empty () => ()
      | _ => print("south ")
    );
    (
      case exits[WEST] of
      | Empty () => ()
      | _ => print("west")
    );
    println!()
  end


(*********************************************************
 * main() function
 *********************************************************)
implement main0 () =
let
  val () = open_universe(DEFAULT_UNIVERSE_PATH)
  val spawn_space = get_space_by_id("spawn")

  var player: Player = spawn_player("You", spawn_space)

  val () = describe(player.location)

  fun loop (pl: &Player): void =
    let
      val here = pl.location
      val exits = get_exits(here)
      val line = prompt()
      val cmd = get_command(line)
    in
      case cmd of
      | Exits () => (print_exits(exits); loop(pl))
      | Move (dir) => (
          if exit_in_direction(exits, dir) then begin
            pl.location := get_exit(exits, dir);
            describe(pl.location);
            loop(pl);
          end else
            (println!("That is not a way out."); loop(pl))
        )
      | Invalid (str) => (
          print("Invalid command '");
          print(str);
          println!("'.");
          loop(pl)
        )
      | Quit () => println!("Bye!")
    end
in
  loop(player)
end
