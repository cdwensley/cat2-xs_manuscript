## expt/cat2-xs.tst for Arvasi/Odabas/Wensley, 08/11/19

gap> LoadPackage( "xmod" );; 

## SetInfoLevel( InfoXMod, 1 );; 

## Section 4.1  
gap> Cat1Select(12);
Usage:  Cat1Select( size, gpnum, num );
[ "C3 : C4", "C12", "A4", "D12", "C6 x C2" ]
gap> Cat1Select(12,3);
Usage:  Cat1Select( size, gpnum, num );
There are 2 cat1-structures for the group A4.
Using small generating set [ f1, f2 ] for source of homs.
[ [range gens], [tail genimages], [head genimages] ] :-
(1)  [ [ f1 ], [ f1, <identity> of ... ], [ f1, <identity> of ... ] ]
(2)  [ [ f1, f2 ],  tail = head = identity mapping ]
2
gap> C1 := Cat1Select(12,3,2);
[A4=>A4]
gap> X1 := XModOfCat1Group(C1);
[triv->A4]

##################

## Section 4.2 
gap> a := (1,2,3,4)(5,6,7,8);;
gap> b := (1,5)(2,6)(3,7)(4,8);;
gap> c := (2,6)(4,8);;
gap> G := Group( a, b, c );;
gap> SetName( G, "c4c2:c2" );
gap> t1a := GroupHomomorphismByImages( G, G, [a,b,c], [(),(),c] );; 
gap> C1a := PreCat1GroupByEndomorphisms( t1a, t1a );;
gap> t1b := GroupHomomorphismByImages( G, G, [a,b,c], [a,(),()] );;
gap> C1b := PreCat1GroupByEndomorphisms( t1b, t1b );;
gap> C2ab := Cat2Group( C1a, C1b );
(pre-)cat2-group with generating (pre-)cat1-groups:
1 : [c4c2:c2 => Group( [ (), (), (2,6)(4,8) ] )]
2 : [c4c2:c2 => Group( [ (1,2,3,4)(5,6,7,8), (), () ] )]
gap> IsCat2Group( C2ab );
true
gap> Size( C2ab );
[ 16, 2, 4, 1 ]
gap> IsCat1Group( Diagonal2DimensionalGroup( C2ab ) ); 
false
gap> t1c := GroupHomomorphismByImages( G, G, [a,b,c], [a,b,c] );;
gap> C1c := PreCat1GroupByEndomorphisms( t1c, t1c );;
gap> C3abc := Cat3Group( C1a, C1b, C1c );
(pre-)cat3-group with generating (pre-)cat1-groups:
1 : [c4c2:c2 => Group( [ (), (), (2,6)(4,8) ] )]
2 : [c4c2:c2 => Group( [ (1,2,3,4)(5,6,7,8), (), () ] )]
3 : [c4c2:c2 => Group( [ (1,2,3,4)(5,6,7,8), (1,5)(2,6)(3,7)(4,8), (2,6)(4,8) 
 ] )]
gap> IsPreCat3Group( C3abc );
true
gap> HigherDimension( C3abc );
4
gap> Front3DimensionalGroup( C3abc ); 
(pre-)cat2-group with generating (pre-)cat1-groups:
1 : [c4c2:c2 => Group( [ (), (), (2,6)(4,8) ] )]
2 : [c4c2:c2 => Group( [ (1,2,3,4)(5,6,7,8), (), () ] )]

##################

## Section 4.3 
gap> C2_82 := Cat2Group( Cat1Group(8,2,1), Cat1Group(8,2,2) );
(pre-)cat2-group with generating (pre-)cat1-groups:
1 : [C4 x C2 => Group( [ <identity> of ..., <identity> of ...,
<identity> of ... ] )]
2 : [C4 x C2 => Group( [ <identity> of ..., f2 ] )]
gap> C2_83 := Cat2Group( Cat1Group(8,3,2), Cat1Group(8,3,3) );
(pre-)cat2-group with generating (pre-)cat1-groups:
1 : [D8 => Group( [ f1, f1 ] )]
2 : [D8=>D8]
gap> up1 := GeneratingCat1Groups( C2_82 )[1];;
gap> lt1 := GeneratingCat1Groups( C2_82 )[2];;
gap> up2 := GeneratingCat1Groups( C2_83 )[1];;
gap> lt2 := GeneratingCat1Groups( C2_83 )[2];;
gap> G1 := Source(up1);; R1 := Range(up1);; Q1 := Range(lt1);;
gap> G2 := Source(up2);; R2 := Range(up2);; Q2 := Range(lt2);;
gap> homG := AllHomomorphisms(G1,G2);;
gap> homR := AllHomomorphisms(R1,R2);;
gap> homQ := AllHomomorphisms(Q1,Q2);;
gap> upmor := Cat1GroupMorphism( up1, up2, homG[1], homR[1] );;
gap> isupmor := IsCat1GroupMorphism( upmor );
true
gap> ltmor := Cat1GroupMorphism( lt1, lt2, homG[1], homQ[1] );;
gap> isltmor := IsCat1GroupMorphism( ltmor );
true
gap> mor2 := PreCat2GroupMorphism( C2_82, C2_83, upmor, ltmor );
<mapping: (pre-)cat2-group with generating (pre-)cat1-groups:
1 : [C4 x C2 => Group( [ <identity> of ..., <identity> of ..., 
  <identity> of ... ] )]
2 : [C4 x C2 => Group( [ <identity> of ..., f2 ] )] -> (pre-)cat
2-group with generating (pre-)cat1-groups:
1 : [D8 => Group( [ f1, f1 ] )]
2 : [D8=>D8] >
gap> IsCat2GroupMorphism( mor2 );
true
gap> mor8283 := AllCat2GroupMorphisms( C2_82, C2_83 );;    
gap> Length( mor8283 ); 
2

##################

## Section 4.4 
gap> d20 := DihedralGroup( IsPermGroup, 20 );;
gap> gend20 := GeneratorsOfGroup( d20 ); 
[ (1,2,3,4,5,6,7,8,9,10), (2,10)(3,9)(4,8)(5,7) ]
gap> p1 := gend20[1];;  p2 := gend20[2];;  p12 := p1*p2; 
(1,10)(2,9)(3,8)(4,7)(5,6)
gap> d10a := Subgroup( d20, [ p1^2, p2 ] );; 
gap> d10b := Subgroup( d20, [ p1^2, p12 ] );; 
gap> c5d := Subgroup( d20, [ p1^2 ] );; 
gap> SetName( d20, "d20" );  SetName( d10a, "d10a" ); 
gap> SetName( d10b, "d10b" );  SetName( c5d, "c5d" );  
gap> XS1 := CrossedSquareByNormalSubgroups( c5d, d10a, d10b, d20 );  
[  c5d -> d10a ]
[   |  |   ]
[ d10b -> d20  ]
gap> IsCrossedSquare( XS1 ); 
true
gap> C2G1 := Cat2GroupOfCrossedSquare( XS1 ); 
(pre-)cat2-group with generating (pre-)cat1-groups:
1 : [((d20 |X d10a) |X (d10b |X c5d))=>(d20 |X d10a)]
2 : [((d20 |X d10a) |X (d10b |X c5d))=>(d20 |X d10b)]
gap> IsCat2Group(C2G1); 
true
gap> Xab := CrossedSquareOfCat2Group( C2ab ); 
crossed square with crossed modules:
up = [Group( [ (1,5)(2,6)(3,7)(4,8) ] ) -> Group( [ ( 2, 6)( 4, 8) ] )]
left = [Group( [ (1,5)(2,6)(3,7)(4,8) ] ) -> Group(
[ (1,2,3,4)(5,6,7,8), (), () ] )]
right = [Group( [ ( 2, 6)( 4, 8) ] ) -> Group( () )]
down = [Group( [ (1,2,3,4)(5,6,7,8), (), () ] ) -> Group( () )]
gap> IsCrossedSquare( Xab ); 
true
gap> IdGroup( Xab ); 
[ [ 2, 1 ], [ 2, 1 ], [ 4, 1 ], [ 1, 1 ] ]

##################

## Section 5 
gap> c4c2 := SmallGroup(8,2);;
gap> all82 := AllCat2Groups( c4c2 );;
gap> Length( all82 );
47
gap> iso82 := AllCat2GroupsUpToIsomorphism( c4c2 );;
gap> Length( iso82 );
14
gap> AllCat2GroupFamilies( c4c2 );
[ [ 1 ], [ 2, 5, 8, 11 ], [ 3, 4, 9, 10 ], [ 14, 17, 22, 25 ], 
  [ 15, 16, 23, 24 ], [ 30 ], [ 6, 7, 12, 13 ], [ 31, 34, 35, 38 ], 
  [ 32, 33, 36, 37 ], [ 18, 19, 26, 27 ], [ 20, 21, 28, 29 ], 
  [ 39, 42, 43, 46 ], [ 40, 41, 44, 45 ], [ 47 ] ]
gap> iso82[8];
(pre-)cat2-group with generating (pre-)cat1-groups:
1 : [Group( [ f1, f2, f3 ] ) => Group( [ f2, f2 ] )]
2 : [Group( [ f1, f2, f3 ] ) => Group( [ f2, f1 ] )]
gap> IsomorphismCat2Groups( all82[31], all82[34] ) = fail;
false

##################

gap> TableRowForCat2Groups( c4c2 );;
Usage:  Cat1Select( size, gpnum, num );
There are 6 cat1-structures for the group C4 x C2.
Using small generating set [ f1, f2 ] for source of homs.
[ [range gens], [tail genimages], [head genimages] ] :-
(1)  [ [ ],  tail = head = zero mapping ]
(2)  [ [ f2 ], [ <identity> of ..., f2 ], [ <identity> of ..., f2 ] ]
(3)  [ [ f2 ], [ f2, f2 ], [ <identity> of ..., f2 ] ]
(4)  [ [ f1 ], [ f1, <identity> of ... ], [ f1, <identity> of ... ] ]
(5)  [ [ f1 ], [ f1, <identity> of ... ], [ f1, f3 ] ]
(6)  [ [ f1, f2 ],  tail = head = identity mapping ]
------------------------------------------------------------------------------\
\
------------- 
------------------------------------------------------------------------------\
\
------------- 
GAP id		Group Name		C2(G)		|C2/~| 
------------------------------------------------------------------------------\
\
------------- 
------------------------------------------------------------------------------\
\
------------- 
[ 8, 2 ]	C4 x C2			47		14
------------------------------------------------------------------------------\
\
------------- 
------------------------------------------------------------------------------\
\
------------- 

##################

gap> TableRowForCat1Groups( c4c2 );;
------------------------------------------------------------------------------\
\
------------- 
------------------------------------------------------------------------------\
\
------------- 
GAP id		Group Name	|End(G)|	|IE(G)|		C(G)		|C/~| 
------------------------------------------------------------------------------\
\
------------- 
------------------------------------------------------------------------------\
\
------------- 
[ 8, 2 ]	C4 x C2		32		10		18		6
------------------------------------------------------------------------------\
\
------------- 
------------------------------------------------------------------------------\
\
------------- 

##################
