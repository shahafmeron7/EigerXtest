def summer(n):
    if n < 10:
        return n
    return n % 10 + summer(int(n/10))


print(summer(2347623))
print(summer(10))
print(summer(9))
print(summer(1900000))
print(summer(0))
