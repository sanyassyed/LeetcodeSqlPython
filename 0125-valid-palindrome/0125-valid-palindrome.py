class Solution:
    def isPalindrome(self, s: str) -> bool:
        l, r = 0, len(s)-1
        print(l, r)
        while l < r:
            while not s[l].isalnum():
                l += 1
                if l == len(s) - 1:
                    return True

            while not s[r].isalnum():
                r -= 1
                if r == 0:
                    return True
                   
            if not s[r].lower() == s[l].lower():
                return False

            l += 1
            r -= 1
        return True

            