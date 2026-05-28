class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seen = dict()

        for i, n in enumerate(nums):
            diff = target - n
            if diff in seen:
                return [i, seen[diff]]
            seen[n] = i

        return [0,0]