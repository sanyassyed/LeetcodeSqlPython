class Solution:
    def findValidPair(self, s: str) -> str:
        hash_num = [0] * 9
        for c in s:
            i = int(c) - 1
            hash_num[i] += 1

        x, y = 0, 1

        while x <= len(s) - 2 and y <= len(s) - 1:
            l = int(s[x])
            r = int(s[y])
            if l != r and l == hash_num[l-1] and r == hash_num[r-1]:
                return (s[x:y+1]) 
            x += 1
            y += 1
        
        return ""

        