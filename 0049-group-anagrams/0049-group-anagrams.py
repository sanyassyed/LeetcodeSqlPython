class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        seen = defaultdict(list)

        for s in strs:
            pattern = [0] * 26
            ord_a = ord('a')
            for c in s:
                pos_c = ord(c) - ord_a
                pattern[pos_c] += 1

            seen[tuple(pattern)].append(s)


        return [v for v in seen.values()]