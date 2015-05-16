#define HASH_TABLE_SIZE 256

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/SATS/hashtblref.sats"

staload _ = "libats/DATS/qlist.dats"

staload _ = "libats/DATS/hashfun.dats"
staload _ = "libats/DATS/linmap_list.dats"
staload _ = "libats/DATS/hashtbl_chain.dats"
staload _ = "libats/ML/DATS/hashtblref.dats"


(*********************************************************
 * Hash tables storing exits among spaces
 *********************************************************)
val to_north =
  hashtbl_make_nil<string, string>(i2sz(HASH_TABLE_SIZE))
val to_east =
  hashtbl_make_nil<string, string>(i2sz(HASH_TABLE_SIZE))
val to_south =
  hashtbl_make_nil<string, string>(i2sz(HASH_TABLE_SIZE))
val to_west =
  hashtbl_make_nil<string, string>(i2sz(HASH_TABLE_SIZE))

val spaces =
  hashtbl_make_nil<string, Space>(i2sz(HASH_TABLE_SIZE))


(*********************************************************
 * Function abstractions over hash tables
 *********************************************************)

// for debugging
fun print_hash_tables (): void =
  begin
    print("to_north: ");
    fprint_hashtbl(stdout_ref, to_north);
    print("\nto_east: ");
    fprint_hashtbl(stdout_ref, to_east);
    print("\nto_south: ");
    fprint_hashtbl(stdout_ref, to_south);
    print("\nto_west: ");
    fprint_hashtbl(stdout_ref, to_west);
    println!()
  end

(*
 * Creates a new room with no exits and adds it to the hash table.
 *)
fun create_room (id: string, name: string, desc: string): Space =
  let
    val room = Room(id, name, desc)
    val _ = hashtbl_insert_any(spaces, id, room)
  in
    room
  end

(*
 * Creates a new door with no connections to rooms and adds it to
 * the hash table.
 * TODO
 *)
fun create_door (
  id: string,
  name: string,
  desc: string,
  key: int
): Space =
  let
    val door = Door(id, name, desc, @{secret=key, description=""})
    val _ = hashtbl_insert_any(spaces, id, door)
  in
    door
  end

(*
 * Given an ID, returns a space with the ID, or Empty if there is
 * no space with that ID.
 *)
fun get_space_by_id (id: string): Space =
  let
    val result = hashtbl_search(spaces, id)
  in
    case result of
    | ~None_vt () => Empty()
    | ~Some_vt (sp) => sp
  end

(*
 * Given a space "from", the ID of another space, and a direction,
 * this function sets the "from" space's exit to point to the other
 * space in the given direction. If the given "from" space is Empty,
 * this function raises EXIT_FROM_EMPTY. If the destination space's
 * ID is the empty string, this function raises EXIT_TO_EMPTY.
 * This function will overwrite any existing exit for the "from"
 * space in a given direction without raising an exception.
 *)
fun set_exit_id (from: Space, to_id: string, dir: Direction): void =
  let
    val from_id = (
      case from of
      | Room (id, _, _) => id
      | Door (id, _, _, _) => id
      | Empty () => ""
    )
    val table = (
      case dir of
      | North () => to_north
      | East () => to_east
      | South () => to_south
      | West () => to_west
    )
  in
    if eq_string_string(from_id, "") then
      $raise EXIT_FROM_EMPTY
    else if eq_string_string(to_id, "") then
      $raise EXIT_TO_EMPTY
    else
      hashtbl_insert_any(table, from_id, to_id)
  end

(*
 * Given a two spaces "from" and "to" and a direction, this function
 * sets "to" to be the destination from "from" in the specified
 * direction. This function calls set_exit_id() which can raise
 * exceptions.
 *)
fun set_exit (from: Space, to: Space, dir: Direction): void =
  let
    val to_id = (
      case to of
      | Room (id, _, _) => id
      | Door (id, _, _, _) => id
      | Empty () => ""
    )
  in
    set_exit_id(from, to_id, dir)
  end

(*
 * Given a space, this function looks up the exits out of this
 * space using the hash tables and returns a list of exits. If there
 * is no exit out of a space, the corresponding entry in the exits
 * list is Empty.
 *)
fun get_exits (space: Space): list(Space, 4) =
  let
    val id = (
      case space of
      | Room (room_id, _, _) => room_id
      | Door (door_id, _, _, _) => door_id
      | Empty () => ""
    )
    val north = case hashtbl_search(to_north, id) of
      | ~None_vt () => Empty()
      | ~Some_vt (dest_id) => get_space_by_id(dest_id)
    val east = case hashtbl_search(to_east, id) of
      | ~None_vt () => Empty()
      | ~Some_vt (dest_id) => get_space_by_id(dest_id)
    val south = case hashtbl_search(to_south, id) of
      | ~None_vt () => Empty()
      | ~Some_vt (dest_id) => get_space_by_id(dest_id)
    val west = case hashtbl_search(to_west, id) of
      | ~None_vt () => Empty()
      | ~Some_vt (dest_id) => get_space_by_id(dest_id)
  in
    if eq_string_string(id, "") then
      $raise EXITS_OF_EMPTY
    else
      cons(north, cons(east, cons(south, cons(west, nil()))))
  end
