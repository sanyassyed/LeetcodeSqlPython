class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        hash_map = {}
        for n in nums:
            hash_map[n] = hash_map.get(n, 0) + 1

        count = [[] for _ in range(len(nums)+1)]

        for i, j in hash_map.items():
            count[j].append(i)

        counter = 0
        result = []
        for vals in count[::-1]:
            while len(vals) != 0 and counter < k:
                result.append(vals.pop())
                counter += 1
            if counter == k:
                return result

        return result
