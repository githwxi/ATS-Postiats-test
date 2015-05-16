******
An online version can be found here:

http://breen.io/projects/dungeon-ats.html
******


[`dungeon-ats`][dungeon-ats] is a port of my [Dungeon][dungeon] project to
[ATS][ats]. This port was written as a final project for CS 520 at Boston
University.

## Original project

[Dungeon][dungeon], originally written in Java, is a program that allows
people to author their own interactive fiction worlds and play with their
friends over the Internet. Anyone can write their own *universe file*,
which specifies which areas can be "visited" and their descriptions, and
the Dungeon server can be started, allowing players to join the server,
speak with each other, explore the world, pick up and give each other
objects, and role play.

This project is comprised of several thousand lines of Java code, much of
which is object-oriented structure and input-checking. This is one of the
reasons why I wanted to port this project to ATS; with its lightweight
algebraic data type features, much of my manual input-checking would be
transformed into type checking on data constructors of the lightweight
types. Furthermore, I wanted to see what types of logic errors I could
avoid by adding program verification to the process of constructing and
mutating a universe. For example, the original Dungeon program contains
no explicit checking that a player cannot be in two rooms at once, or
that an object cannot be held by two players at once. Furthermore, it
makes no guarantee that a universe file is well-formed; for example, if
there are "dead end" rooms that no player can escape from, or
"orphan" rooms that are not accessible from any other locations.

## The ATS port

`dungeon-ats` does not implement all the features of the original project.
Importantly, it does not implement any networking features, so `dungeon-ats`
is entirely single-player. The universe file format it understands is
extremely simple (unlike the YAML format used by the Java version). Finally,
while there is some support for in-game items, this support is not
currently in use.

What the port does have, however, is basic universe file-reading capability,
world simulation, and a simple command line that understands movement
commands.

### The `.universe` file

When `dungeon-ats` starts, it reads in a universe file that specifies
all the "spaces" (game areas) in the universe, and any connections
between the spaces. The universe file also specifies where items are
in the universe. All connections between spaces are referred to as
"exits". A space can have up to four exits --- one in each cardinal
direction (north, east, south, and west). An item must be in exactly
one room.

In a `.universe` file, every space or item is defined by a sequence
of fields, each taking up exactly one line. Each space or item is given
a unique ID, which can be any string except `~`.

The fields in a *room* specification must take the following form:

    room
    <id>
    <id_of_northern_exit>
    <id_of_eastern_exit>
    <id_of_southern_exit>
    <id_of_western_exit>
    <room_name>
    <description>

A *door* specification takes the following form:

    door
    <id>
    <id_of_room_from>
    <id_of_room_to>
    <name>
    <description>
    <key_secret>

The `<key_secret>` should be an integer that is shared with the key to
this door, if it is ever placed in the universe. Lastly, the *key*
specification is a type of item specification and takes the form:

    key
    <id>
    <room_id>
    <name>
    <description>
    <secret>

Here are some important notes:

*   `dungeon-ats` expects that one space have the ID `spawn`,
    which is the space that the player will start the game in.
*   If a space does not have an exit in a particular direction,
    a single `~` character is used to indicate this.

In the [GitHub repository][dungeon-ats] for this project, a sample
universe file is given (`default.universe`).

### Data structures

`dungeon-ats` reads the universe file and produces instances of
the `Space` algebraic data type. Here's how `Space` is currently
defined:

    datatype Space =
      | Room of (string,            // ID
                 string,            // name
                 string)            // description

      | Door of (string,            // ID
                 string,            // name
                 string,            // description
                 Key)

      | Empty of ()

A `Room` is a simple type of space that has a string ID (taken from
the universe file), and represents a single point in the game that
a player can occupy. A `Door` is another type of space, which can
allow passage to another `Space` if the player is in possession of
the correct `Key` item. `Empty` is used to indicate that there is
no exit out of a `Room` in a particular direction.

Each time a specification is read from the universe file, the
`create_room()` function is called:

    fun create_room (
      id: string,
      name: string,
      desc: string
    ): Space =
        let
          val room = Room(id, name, desc)
          val _ = hashtbl_insert_any(spaces, id, room)
        in
          room
        end

This function inserts the room into the `spaces` hash table,
which contains mappings from the space IDs to their values.
A hash table is used here since we will also set up the exits
out of a room using the exit space's ID, which may not yet
be created, depending on where in the universe file it is
defined.

To store the exits out of a particular room, four hash tables
are used: one for each direction. For example, for a space with
the ID `room1`, the `to_north` hash table may stores the string
ID of the door `door9` at `to_north["room1"]`. These hash tables
and the functions that manipulate them are in `exitstable.hats`.

### Descriptions

For all types of `Space`, `Item`s (the type used for storing
in-game objects that players can hold),
these values represent things in the game
universe that a player might need descriptions of. For example,
whenever a player enters a room, its description is printed
to the screen. You might also imagine that a player would
ask to obtain the description of an object in a room, or a key
in their possession.[^1]

As in the original project, `dungeon-ats` has standard
printing functions (which might be used for debugging), and
special "describe" functions that are used to convey an
object or space's description to the player, while the game is
being played. To make it easier for me to print descriptions
of these objects in the code, I introduced a symbol `describe`:

    symintr describe

I then implemented a few "describe" functions. For example,
here is a function that prints the description of a `Direction`,
a type used for representing the direction of exits out of a space:

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

I then used `overload` to specify that `describe_dir()` can be used
as simply `describe(d)` for a `Direction` called `d`:

    overload describe with describe_dir

I found support for this in ATS to be simple, but very effective.

### Exceptions

I originally intended to use exceptions in ATS to handle cases when
a player tried to move out of a space in a direction that does not
lead to another space. However, I decided to handle this case
differently, by explicitly checking whether an exit in a particular
direction is not `Empty`.

I ended up using exceptions to indicate certain conditions that
could come up when reading in a universe file that is written
incorrectly. A simple example of these is `BAD_SPAWN`. The `BAD_SPAWN`
exception is raised when no space in the universe file is given the
ID `spawn`, which should cause `dungeon-ats` to stop, since it
cannot know which space to start the game in.

### Verification

In my initial proposal, I mentioned that proof functions could be
written to prove certain impossible conditions about the construction
of the game universe. For example, the following conditions might be
verified:

*   It should be impossible to create a game universe with "orphan"
    spaces. These are spaces where no other spaces contain an exit
    to this space.
*   It should be impossible for a room to have an exit to itself.
*   It should be impossible for a player or item to be in two
    spaces at once.

These conditions, especially the first two, could be verified if the
abstract types were extended and a different implementation of storing
exits from space to space is chosen. At present the use of hash tables
precludes the ability to write proof functions for these conditions.
However, if exits among spaces were stored in the algebraic type value
itself, a dependently typed `Space` implementation might be written:

    // a room indexed by four other spaces --- the exits out of the space
    typedef RoomExits = [s1, s2, s3, s4: Space] Room(s1, s2, s3, s4)

And proof functions might be written taking these dependently typed `Room`
values.

It might also be possible to verify that the functions that cause the
universe to change will not end up creating an invalid state (as in
the example impossible conditions above). For example, a proof function
could be written to specify that `move_player()` will always remove a
player from the room they are in and place them into some other room.
Proofs of these types would guarantee *consistency* of the game universe.

#### Other verification ideas

*   If network features are ultimately added to the implementation,
    it would be very useful to set up server-side verification to guarantee
    consistency of the universe.
*   For networking, it might also be useful to prove it impossible for clients
    to send the server "bad" data about their location, letting them
    "teleport" across the universe or take or drop items inappropriately.


[^1]:   The original Dungeon project has very flexible support
        for items that a player can hold --- for example, it
        supports defining a custom type of object, like a quartz
        watch, which can respond to in-game time, which changes its
        description based on the time of day or how much battery
        it has.

[dungeon-ats]: https://github.com/abreen/dungeon-ats
[dungeon]: https://github.com/abreen/Dungeon
[ats]: http://www.ats-lang.org/
