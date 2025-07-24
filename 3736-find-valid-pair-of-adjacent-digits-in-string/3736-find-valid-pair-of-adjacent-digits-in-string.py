class Solution:
    def findValidPair(self, s: str) -> str:
        cnt = collections.Counter(s)

        for i, c in enumerate(s):
            if i == 0: continue
            if s[i] != s[i-1] and int(c) == cnt[c] and int(s[i-1]) == cnt[s[i-1]]:
                return(s[i-1:i+1])

        return ""

        