class Solution:
    def removeStars(self, s: str) -> str:
        st = deque()
        for i in s:
            if i == '*':
                if len(st) != 0:
                    st.pop()
            else:
                st.append(i)
        return "".join(list(st))
            