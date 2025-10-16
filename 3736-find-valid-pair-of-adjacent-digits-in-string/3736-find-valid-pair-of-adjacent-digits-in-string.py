class Solution:
    def findValidPair(self, s: str) -> str:
        scan = [0] * 10

        for c in s:
            scan[int(c)] += 1

        i, j = 0, 1

        while i<j and j<len(s):
            l = int(s[i])
            r = int(s[j])
            if l != r and scan[l] == l and scan[r] == r:
                return s[i] + s[j]

            i += 1
            j += 1

        return ""
        