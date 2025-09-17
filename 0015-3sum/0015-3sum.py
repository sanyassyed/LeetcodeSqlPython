class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        result = []
        nums.sort()

        for i, n in enumerate(nums):
            if i > 0 and nums[i-1] == n:
                continue
            l, r = i+1, len(nums)-1
            while l < r:
                total = n + nums[l] + nums[r]

                if total < 0:
                    l += 1
                elif total > 0:
                    r -= 1
                else:
                    result.append([n, nums[l], nums[r]])
                    l += 1
                    r -= 1
                    while l < r and nums[l-1] == nums[l]:
                        l += 1
                    while l < r and nums[r] == nums[r+1]:
                        r -= 1

        return result

