class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        # l_s, l_t = len(s), len(t)
        # if l_s != l_t:
        #     return False
        # result = [0] * 26
        # asc_a = ord('a')

        # for c in s:
        #     result[ord(c) - asc_a] += 1


        # for c in t:
        #     if result[ord(c)-asc_a] == 0:
        #         return False
        #     result[ord(c)-asc_a] -= 1

        # return True

        l_s, l_t = len(s), len(t)
        if l_s != l_t:
            return False

        hash_s = {}
        hash_t = {}

        for i in range(l_s):
            c_s = s[i]
            c_t = t[i]
            hash_s[c_s] = hash_s.get(c_s, 0) + 1
            hash_t[c_t] = hash_t.get(c_t, 0) + 1

        for k,v in hash_s.items():
            if hash_t.get(k, 0) != v:
                return False

        return True
