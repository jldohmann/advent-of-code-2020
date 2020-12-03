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

"""
PART ONE
"""

def find_product_pair(lst):
    sets = set(lst)
    pairs = list(combinations(sets, 2))
    sums = [a + b for (a,b) in pairs]
    for val in sums:
        if val == 2020:
            ind = sums.index(val)
            mult = pairs[ind]
            return mult[0] * mult[1]

find_product_pair(input)

"""
PART TWO
"""

def find_product_triple(lst):
    sets = set(lst)
    trip = list(combinations(sets, 3))
    sums = [a + b + c for (a,b,c) in trip]
    for val in sums:
        if val == 2020:
            ind = sums.index(val)
            mult = trip[ind]
            return mult[0] * mult[1] * mult[2]

find_product_triple(input)
