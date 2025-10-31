class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        hash_n = {}
        for i in range(len(nums)):
            diff = target - nums[i]
            if diff in hash_n:
                return [hash_n[diff], i]
            hash_n[nums[i]] = i

        return None
        