class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        len_s = len(s)
        len_t = len(t)

        if len_s != len_t:
            return False
        
        seen = [0] * 26
        ord_a = ord('a')

        for x in s:
            pos_x = ord(x)-ord_a
            seen[pos_x] += 1

        for x in t:
            pos_x = ord(x) - ord_a
            if not seen[pos_x]:
                return False
            seen[pos_x] -= 1

        return True

