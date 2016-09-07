#include "share/atspre_staload.hats"
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"

staload "sample_midterm.sats"

implement int2binary (x) = let
	#define :: list0_snoc
	#define nil list0_nil 

    fun i2b (x:int): list0 int =
	    if x <= 0
	    then nil ()
	    else int2binary (x / 2) :: (x mod 2)
in 
    if x = 0 
    then 0 :: nil ()
    else i2b x
end 

implement mylist0_average (xs) = let 
	#define :: list0_cons 
	#define nil list0_nil 

	fun step (xs: list0 double, n: int, sum: double): list0 double = 
		case+ xs of 
		| nil () => nil ()
		| x :: xs => (x+sum)/(n*1.0) :: step (xs, n+1, x+sum)
in 
	step (xs, 1, 0.0)
end 


implement mylist0_isord (xs) = let 
	#define :: list0_cons 
	#define nil list0_nil 
in 
	case+ xs of 
	| nil () => true
	| x :: nil () => true 
	| x :: y :: xs => 
		if x <= y 
		then mylist0_isord (y :: xs)
		else false 
end

implement {a} mylist0_merge (xs, ys) = let 
	#define :: list0_cons 
	#define nil list0_nil 
in 
	case+ (xs, ys) of
	| (nil (), _) => ys 
	| (_, nil ()) => xs 
	| (x :: xs, y :: ys) => x :: y :: mylist0_merge (xs, ys)
end 


implement {a} mylist0_split (xs) = let 
	#define :: list0_cons 
	#define nil list0_nil 
	#define rev list0_reverse

	fun {a:t@ype} step (xs: list0 a, ret: (list0 a, list0 a), left: bool): (list0 a, list0 a) = 
		case+ xs of 
		| nil () => ret
		| x :: xs => 
			if left
			then step (xs, (x :: ret.0, ret.1), false)
		  	else step (xs, (ret.0, x :: ret.1), true)

	val ret = step (xs, (nil (), nil ()), true)
in 
	(rev ret.0, rev ret.1)
end 


implement mytree0_tally (t) = 
	case+ t of 
	| tree0_nil () => 0
	| tree0_cons (l, x, r) => x + mytree0_tally l + mytree0_tally r 

implement {a} mytree0_flatten (t) = let 
	#define :: list0_cons 
	#define nil list0_nil 
	#define append list0_append
in 
	case+ t of 
	| tree0_nil () => nil () 
	| tree0_cons (l, x, r) => append (mytree0_flatten l, x :: mytree0_flatten r)
end 


implement substring_test (orig, sub) = let 
	val orig = g1ofg0 orig 
	val sub = g1ofg0 sub 

	#define is_empty string_is_empty 
	#define len string_length
	#define head string_head 
	#define tail string_tail
in 
	if is_empty sub then true
	else if is_empty orig then false
	else 
		if head orig = head sub 
		then substring_test (tail orig, tail sub) || substring_test (tail orig, sub)
		else substring_test (tail orig, sub)
end 


implement main0 () = () where {

	val _ = println! (int2binary 10)


	val list = g0ofg1 ($list{double}(1.0,2.0,3.0))
	val _ = println! list 
	val _ = println! (mylist0_average list)



	val list = g0ofg1 ($list{int}(1,2,3,4,5,6,7,8,9))
	val _ = println! list
	val spilt = mylist0_split<int> list 
	val _ = println! (spilt.0)
	val _ = println! (spilt.1)

	#define tcons tree0_cons 
	#define tnil tree0_nil 
	val tree = 
		tcons (
			tcons (
				tcons (tnil, 1, tnil), 
				2, 
				tcons (tnil, 3, tnil)), 
			4, 
			tcons (
				tcons (tnil, 5, tnil), 
				6, 
				tcons (tnil, 7, tnil)))

	val _ = println! (mytree0_flatten<int> tree)

	val _ = assertloc (substring_test ("computer", "put") = true)
	val _ = assertloc (substring_test ("computer", "puta") = false)
	val _ = assertloc (substring_test ("", "") = true)

	val _ = println! "Passed"
}
