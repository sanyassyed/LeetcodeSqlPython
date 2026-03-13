class Solution:
    def isPalindrome(self, s: str) -> bool:
        l, r = 0, len(s)-1

        while l<=r:
            while not s[l].isalnum():
                if l < len(s)-1 and l <= r:
                    l += 1
                else:
                    break

            while not s[r].isalnum(): 
                if r >=0  and l <= r:
                    r-=1
                else:
                    break

            if l <= r:
                if s[l].lower() == s[r].lower():
                    l += 1
                    r -= 1
                else:
                    return False

        return True