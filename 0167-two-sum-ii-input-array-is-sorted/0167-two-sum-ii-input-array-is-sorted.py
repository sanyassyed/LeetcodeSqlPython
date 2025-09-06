class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        hash_nums = {}
        for i in range(len(numbers)):
            diff = target - numbers[i]
            if diff in hash_nums:
                return [hash_nums[diff]+1, i+1]
                #ind = hash_nums[diff] + 1
                #if ind >=1 and ind <= i+1:
                    #return [ind, i+1]
                
            hash_nums[numbers[i]] = i


        