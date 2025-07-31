import numpy as np
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        hash_map = {}
        result = []
        counter = 1
        for n in nums:
            hash_map[n] = hash_map.get(n, 0) + 1
        # print(hash_map)
        for (i,j) in sorted(hash_map.items(), key=lambda item: item[1], reverse=True):
            if counter <= k:
                result.append(i)
            counter += 1

        return result

        
                



        