class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        hash_map = {}

        for n in nums:
            hash_map[n] = hash_map.get(n, 0) + 1


        count_map = [[] for x in  range(0,len(nums)+1)]

        for i,v in hash_map.items():
            count_map[v].append(i)


        print(count_map)
        result = []

        #for li in count_map[::-1]:
        for li in reversed(count_map):
            while li and len(result) < k:
                result.append(li.pop())
            if len(result) == k:
                return result
