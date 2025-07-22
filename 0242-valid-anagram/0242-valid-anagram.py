class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        h_s = {}
        h_t = {}
        l_s = len(s)
        l_t = len(t)

        if l_s != l_t:
            return False
        
        for i in range(l_s):
            c_s = s[i]
            h_s[c_s] = h_s.get(c_s, 0) + 1
            c_t = t[i] 
            h_t[c_t] = h_t.get(c_t, 0) + 1


        for k in h_s:
            if h_s[k] != h_t.get(k, 0):
                return False

        return True       