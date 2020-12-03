import urllib.request
from itertools import combinations
# Download from https://adventofcode.com/2020/day/1/input

# Read in raw HTML
HtmlFile = open("input.html", 'r', encoding='utf-8')
raw = HtmlFile.read()

# Remove spaces from strings and convert to list of integers
input = []
rawList = raw.split('\n')
for x in rawList:
    if x.strip():
        n = int(x)
        input.append(n)

"""""""""""""""
PART ONE
"""""""""""""""

def find_product_pair(lst):

    # get all possible pairs and total them
    sets = set(lst)
    pairs = list(combinations(sets, 2))
    sums = [a + b for (a,b) in pairs]
    
    # find the index of the pair that totals to 2020 and multiply
    for val in sums:
        if val == 2020:
            ind = sums.index(val)
            mult = pairs[ind]
            return mult[0] * mult[1]

find_product_pair(input)

"""""""""""""""
PART TWO
"""""""""""""""

def find_product_triple(lst):

    # get all possible triplets and total them
    sets = set(lst)
    trip = list(combinations(sets, 3))
    sums = [a + b + c for (a,b,c) in trip]
    
    # find the index of the triplet that totals to 2020 and multiply
    for val in sums:
        if val == 2020:
            ind = sums.index(val)
            mult = trip[ind]
            return mult[0] * mult[1] * mult[2]

find_product_triple(input)
