class Solution:
    def findValidPair(self, s: str) -> str:
        hash_map = {}
        for c in s:
            hash_map[c] = hash_map.get(c, 0) + 1

        i, j = 0, 1

        while i < j and j < len(s):
            l = s[i]
            r = s[j]
            if l != r and hash_map.get(l, 0) == int(l) and hash_map.get(r, 0) == int(r):
                return f"{l}{r}"
            i += 1
            j += 1
        return ""


        