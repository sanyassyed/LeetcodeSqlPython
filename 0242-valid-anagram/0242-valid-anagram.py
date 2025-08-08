class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        vals = [0] * 26
        ord_a = ord('a')

        if len(s) != len(t):
            return False

        for c in s:
            ord_c = ord(c) - ord_a
            vals[ord_c] += 1

        for c in t:
            ord_c = ord(c) - ord_a
            if vals[ord_c] != 0:
                vals[ord_c] -= 1
            else:
                return False

        return True
