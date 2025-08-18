class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        l_s = len(s)
        l_t = len(t)

        if l_s != l_t:
            return False

        maps = [0] * 26
        ord_a = ord('a')

        for c in s:
            maps[ord(c) - ord_a ] += 1


        for c in t:
            if maps[ord(c) - ord_a] == 0:
                return False
            maps[ord(c) - ord_a] -= 1

        return True

        
            


        