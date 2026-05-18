class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        len_s, len_t = len(s), len(t)
        if len_s != len_t:
            return False
        check = [0] * 26
        ord_a = ord('a')

        for char in s:
            ord_char = ord(char) - ord_a
            check[ord_char] += 1

        # print(check)

        for char in t:
            ord_char = ord(char) - ord_a
            if not check[ord_char]:
                return False
            check[ord_char] -= 1

        # print(check)

        return True


