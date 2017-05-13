(* ****** ****** *)
(*
** Scene setup
*)
(* ****** ****** *)
//
staload "./main.sats"
#include "./theParams.hats"
//
#include "{$LIBATSCC2JS}/staloadall.hats"
//
(* end of [theReset.dats] *)

implement random_scene(board) = let
	fun randomint (): int = let 
		// this is a hack
		// r is actually a double between 0 and 1
		val r = $extfcall(int, "Math.random")
	in 
		r * 100
	end
in 
	board.foreach()(lam (x, y) => let 
		val r = randomint()
	in 
		if r > 10
		then board[x,y]:=0
		else if r > 5 then board[x,y]:=3
		else board[x,y]:=2
	end)
end

