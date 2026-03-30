class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        nums_s = set(nums)
        max_length = 0
        for n in nums_s:
            if n-1 not in nums_s:
                counter = 0
                while (n + counter) in nums_s:
                    counter += 1
                max_length = max(counter, max_length)
            if max_length == len(nums_s):
                break
        
        return max_length
        
                