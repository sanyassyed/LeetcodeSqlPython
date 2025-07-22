class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        hash_n = defaultdict(list)
        for i in range(len(nums)):
            if nums[i] in hash_n:
                for x in hash_n[nums[i]]:
                    if abs(x - i) <= k:
                        return True
            hash_n[nums[i]].append(i)
        
        return False