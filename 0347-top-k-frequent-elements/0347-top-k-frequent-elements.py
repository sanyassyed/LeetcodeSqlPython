class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        count = {}
        for n in nums:
            count[n] = count.get(n, 0) + 1

        print(count)

        count_list = [[] for _ in range(len(nums)+1)]

        for number, times in count.items():
            count_list[times].append(number)

        print(count_list)


        result = []
        for items in count_list[::-1]:
            while items and len(result) < k :
                result.append(items.pop())

            if len(result) == k:

                return result

        return result

