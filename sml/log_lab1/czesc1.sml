(*
 * Zadanie domowe 1, czesc 1
 *  structure file
 *)
structure foo :> PART_ONE =
struct
  exception NotImplemented

  datatype 'a tree= Leaf of 'a | Node of 'a tree * 'a * 'a tree

  fun sum (n:int) : int =
	if n = 1 then 1
	else n + sum(n-1);

  fun fac (n:int) : int =
	if n = 1 then 1
	else n * fac(n-1);
 
  fun fib (n:int) : int =
	if n = 0 then 1
	else if n = 1 then 1
	else fib(n-1) + fib(n-2);
 
  fun gcd (a:int, b:int) : int =
	if a = 0 then b;
	else if b = 0 then a;
	else if a > b then gcd(a mod b, b)
	else gcd(a, b mod a);

  fun max _ = raise NotImplemented

  fun sumTree _ = raise NotImplemented
  fun depth _ = raise NotImplemented
  fun binSearch _ _ = raise NotImplemented
  fun preorder _ = raise NotImplemented

  fun listAdd _ _ = raise NotImplemented
  fun insert _ _ = raise NotImplemented 
  fun insort _ = raise NotImplemented 

  fun compose _ _  = raise NotImplemented 
  fun curry _ _ _ = raise NotImplemented 
  fun uncurry _ _ = raise NotImplemented
  fun multifun _ _ = raise NotImplemented

  fun ltake _ _ = raise NotImplemented
  fun lall _ _ = raise NotImplemented
  fun lmap _ _ = raise NotImplemented
  fun lrev _ = raise NotImplemented
  fun lzip _ = raise NotImplemented
  fun split _ = raise NotImplemented
  fun cartprod _ _ = raise NotImplemented

end
