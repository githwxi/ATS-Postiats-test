#define BOLD "\033[1m"
#define NO_BOLD "\033[22m"

#define DEFAULT_UNIVERSE_PATH "default.universe"

#define NORTH 0
#define EAST 1
#define SOUTH 2
#define WEST 3

(*********************************************************
 * Exceptions
 *********************************************************)
exception BAD_SPAWN
exception EXIT_FROM_EMPTY
exception EXIT_TO_EMPTY
exception EXITS_OF_EMPTY
exception DESCRIBING_EMPTY


(*********************************************************
 * Data types
 *********************************************************)
datatype Direction = | North | East | South | West

typedef Key = @{
  secret = int,
  description = string
}

datatype Space =
  | Room of (string,            // ID
             string,            // name
             string)            // description

  | Door of (string,            // ID
             string,            // name
             string,            // description
             Key)

  | Empty of ()

typedef Player = @{
  name = string,
  location = Space
}

typedef Item = @{
  name = string,
  description = string,
  location = Space
}
