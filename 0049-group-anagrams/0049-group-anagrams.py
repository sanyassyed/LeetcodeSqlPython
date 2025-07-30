class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        hash_map = defaultdict(list)
        ord_a = ord('a')
        for s in strs:
            map_s = [0] * 26
            for c in s:
                map_s[ord(c)-ord_a] += 1

            hash_map[tuple(map_s)].append(s)
        # print(hash_map)

        return [x for x in hash_map.values()]
            
            

        