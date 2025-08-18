class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        '''
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
        '''
        l_s = len(s)
        l_t = len(t)
        if l_s != l_t:
            return False
        map_s, map_t = {}, {}

        for i in range(l_s):
            c_s = s[i]
            c_t = t[i]

            map_s[c_s] = map_s.get(c_s, 0) + 1
            map_t[c_t] = map_t.get(c_t, 0) + 1

        for k,v in map_s.items():
            if map_t.get(k, 0) != v:
                return False

        return True

            

        
            


        