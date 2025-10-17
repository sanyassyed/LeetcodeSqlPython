class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        data_dict = [0] * 26

        for i in range(len(s)):
            ord_a = ord('a')
            s_i = ord(s[i]) - ord_a
            data_dict[s_i] += 1

        for i in range(len(t)):
            t_i = ord(t[i]) - ord_a
            if data_dict[t_i] == 0:
                return False
            data_dict[t_i] -= 1

        return True

        
        