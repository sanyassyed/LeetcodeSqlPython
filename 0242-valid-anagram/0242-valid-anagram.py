class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        l_s, l_t = len(s), len(t)
        if l_s != l_t:
            return False
        result = [0] * 26
        asc_a = ord('a')

        for c in s:
            result[ord(c) - asc_a] += 1

        print(result)

        for c in t:
            if result[ord(c)-asc_a] == 0:
                return False
            result[ord(c)-asc_a] -= 1

        return True
