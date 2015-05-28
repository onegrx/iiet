(*
 * Zadanie domowe 1, czesc 1
 *  structure file
 *)
structure foo :> PART_ONE =
struct
  exception NotImplemented

  datatype 'a tree = Leaf of 'a | Node of 'a tree * 'a * 'a tree

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
    if a = 0 then b
    else if b = 0 then a
    else if a > b then gcd(a mod b, b)
    else gcd(a, b mod a);

  fun max _ = raise NotImplemented

  fun sumTree (t:int tree) : int = 
    case t of
      Leaf l => l
      | Node (l, v, r) => v + sumTree l + sumTree r;
        
  fun depth (x:'a tree) =
  case x of
    Leaf (l) => 0
    | Node (a, b, c) =>
      let
        val al = 1 + depth(a)
        val cl = 1 + depth(c)
      in
        if al > cl then al
        else cl
      end;
      
(* yet another shorter version
  
  fun depth (t:'a tree) = 
  case t of
    Leaf l => 0
    | Node (l, _, r) =>
      1 + (fn (x,y) => 
        if x > y then x else y) (depth l,depth r);
        
*)
  
  fun binSearch (t:int tree) (x:int) : bool =
    case t of
      Leaf l => l = x
      | Node (l, v, r) => 
        if x=v then true
        else if x < v then binSearch l x
        else binSearch r x;
            
  fun preorder (x: 'a tree):'a list =
    case x of
      Leaf (l) => [l]
      | Node (a, b, c) =>
        b :: preorder(a) @ preorder(c);
        
  fun listAdd (a: int list) (b: int list) : int list =
    case a of
      nil => b
      | xa :: xas =>
        case b of
          nil => a
          | xb :: xbs => xa+xb :: listAdd(xas)(xbs);        
        
  fun insert (m:int) (l:int list) : int list =
    case l of
      nil => [m]
      | x :: xs => 
        if x > m then m :: x :: xs
        else x:: insert (m)(xs);
                        
  fun insort _ = raise NotImplemented 

  fun compose f g  = 
    (fn x => g (f x)) 
    
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
