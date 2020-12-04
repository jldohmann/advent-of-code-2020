(* Download from https://adventofcode.com/2020/day/2/input *)
raw = Import[FileNameJoin[{$HomeDirectory, "Downloads", "input-day-2.html"}], "HTML"]
input = Partition[StringSplit[raw, " "], 3]

ClearAll[countValid]
countValid[in_List] := 
 Module[{char, range, rRule, pass, table, bool, hash, pos, part1, part2},
 
  (* First, separate ranges, characters and full passwords into different lists *)
  
  pass = in[[All, 3]];
  
  char = With[{lett = in[[ All, 2 ]]},
    Table[
     StringTrim[Part[lett, n], ":"],
     {n, Length[lett]}
    ]];
    
  rRule = {a_, b_} :> Range[a, b];
  range = Map[ToExpression,
     StringSplit[in[[ All, 1 ]], "-"]
   ] /. rRule;
  
  (***************************************)
  (* PART ONE *)

  table = MapThread[StringCount, {pass, char}];
  bool = MemberQ[#1, #2] & @@@ Thread[range -> table];
  
  (* 
  Do not use AssociationThread; it gets rid of repeats thus reducing size of list
  Use Thread instead to create list of rules
  *)
  
  hash = Thread[pass -> bool];
  part1 = Length[Select[Values[hash], TrueQ[#] &]];
  
  (***************************************)
  (* PART TWO *)
  
  With[{
    firstPos = First /@ range,
    lastPos = Last /@ range
    },
   pos = Partition[Riffle[firstPos, lastPos], {2}];
  ];
  
  table = MapThread[StringPosition, {pass, char}][[ All, All, 1 ]];
  (* Choose intersecting sets that happen in only one position *)
  
  bool = Intersection[#1, #2] & @@@ Thread[table -> pos];
  hash = Thread[pass -> bool];
  part2 = Length[Select[Values[hash], Length[#] == 1 &]];
  
  {part1, part2}
]

countValid[input]
