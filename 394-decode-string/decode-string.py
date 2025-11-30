class Solution:
    def decodeString(self, s: str) -> str:
        num_stack = []
        str_stack = []
        current_num = 0
        current_str = ''
        
        for char in s:
            if char.isdigit():
                current_num = current_num * 10 + int(char)
            elif char == '[':
                # Push current state to stacks
                num_stack.append(current_num)
                str_stack.append(current_str)
                # Reset for new level
                current_num = 0
                current_str = ''
            elif char == ']':
                # Pop and decode
                num = num_stack.pop()
                prev_str = str_stack.pop()
                current_str = prev_str + current_str * num
            else:
                # Regular character
                current_str += char
        
        return current_str