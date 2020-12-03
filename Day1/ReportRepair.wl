(* Download from https://adventofcode.com/2020/day/1/input *)
raw = Import[FileNameJoin[{$HomeDirectory, "Downloads", "input.html"}], "HTML"]
input = ToExpression /@ StringSplit[raw, " "]

(* PART ONE *)

ClearAll[findProductPair]
findProductPair[l_List] := Module[{pairs, sum, index, product},
  pairs = Subsets[l, {2}];
  sum = Map[Total, pairs];
  index = Position[sum, First[Select[sum, MatchQ[#, 2020] &]]];
  product = With[
    {values = First[Part[pairs, Flatten @ index]]},
    Times[#1, #2] & @@ values
    ]
  ]

findProductPair[input]

(* PART TWO *)

ClearAll[findProductTriple]
findProductTriple[l_List] := Module[{trip, sum, index, product},
  trip = Subsets[l, {3}];
  sum = Map[Total, trip];
  index = Position[sum, First[Select[sum, MatchQ[#, 2020] &]]];
  product = With[
    {values = First[Part[trip, Flatten @ index]]},
    Times[#1, #2, #3] & @@ values
    ]
  ]

findProductTriple[input]
