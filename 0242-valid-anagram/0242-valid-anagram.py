class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        len_s = len(s)
        len_t = len(t)

        if len_s != len_t:
            return False

        ord_a = ord('a')
        count = [0] * 26

        for x in s:
            pos_x = ord_a - ord(x)
            count[pos_x] += 1

        for x in t:
            pos_x = ord_a - ord(x)
            if count[pos_x] == 0:
                return False
            count[pos_x] -= 1

        return True
