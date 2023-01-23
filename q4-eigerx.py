def count_max_elements(stream):
    stream = list(map(int, stream.split()))

    def helper(lst):
        if lst[0] == 0:
            return 0, 0
        max_count, max_element = helper(lst[1:])
        if lst[0] > max_element or max_element == 0:
            return 1, lst[0]
        elif lst[0] == max_element:
            return max_count + 1, max_element
        else:
            return max_count, max_element
    max_count, max_element = helper(stream)
    return max_element, max_count


print(count_max_elements('1 1 1 50 -376 490 5 19 5 50 3 41 42 2 0'))
print(count_max_elements('1 5 42 5 19 5 3 42 -35 0'))
print(count_max_elements('1 0'))
print(count_max_elements('-50 -50 -1 -90 -90 0'))
print(count_max_elements('-50 0'))
