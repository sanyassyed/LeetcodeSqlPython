class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        seen_r = defaultdict(list)
        seen_c = defaultdict(list)
        seen_sq = defaultdict(list)
        for r in range(0,9):
            for c in range(0,9):
                item = board[r][c]
                if item == '.':
                    continue
                if item in seen_r[r]:
                    return False
                if item in seen_c[c]:
                    return False
                if item in seen_sq[(r//3,c//3)]:
                    return False
                seen_r[r].append(item)
                seen_c[c].append(item)
                seen_sq[(r//3, c//3)].append(item)
            
        return True