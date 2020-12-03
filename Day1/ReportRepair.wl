(* Download from https://adventofcode.com/2020/day/1/input *)
raw = Import[FileNameJoin[{$HomeDirectory, "Downloads", "input.html"}], "HTML"]
input = ToExpression /@ StringSplit[raw, " "]

(******************************************************************************)
(*   PART ONE   *)

ClearAll[findProductPair]
findProductPair[l_List] := Module[{pairs, sum, index, product},

  (* get all possible pairs and total them *)
  pairs = Subsets[l, {2}];
  sum = Map[Total, pairs];
  
  (* find the index of the pair that totals to 2020 and multiply *)
  index = Position[sum, First[Select[sum, MatchQ[#, 2020] &]]];
  product = With[
    {values = First[Part[pairs, Flatten @ index]]},
    Times[#1, #2] & @@ values
  ]
]

findProductPair[input]

(******************************************************************************)
(*   PART TWO   *)

ClearAll[findProductTriple]
findProductTriple[l_List] := Module[{trip, sum, index, product},

  (* get all possible triplets and total them *)
  trip = Subsets[l, {3}];
  sum = Map[Total, trip];
  
  (* find the index of the triplet that totals to 2020 and multiply *)
  index = Position[sum, First[Select[sum, MatchQ[#, 2020] &]]];
  product = With[
    {values = First[Part[trip, Flatten @ index]]},
    Times[#1, #2, #3] & @@ values
  ]
]

findProductTriple[input]
