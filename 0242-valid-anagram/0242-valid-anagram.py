class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        l = [0] * 26
        l_s = len(s)
        l_t = len(t)
        a = ord('a')
        if l_s != l_t:
            return False
        for i in range(l_s):
            sc = s[i]
            sc_pos = ord(sc) - a
            l[sc_pos] += 1

            tc = t[i]
            tc_pos = ord(tc) - a
            l[tc_pos] -= 1

        for v in l:
            if v != 0:
                return False

        return True
            
        