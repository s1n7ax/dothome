def isstring(val):
    return isinstance(val, str)

def isstring_list(val):
    if isinstance(val, list) is False:
        print('isstring_list only takes list as an argument')
        return

    for ele in val:
        if isinstance(ele, str) is False:
            return False

    return True

def isstring_2d_list(val):
    if isinstance(val, list) is False:
        print('isstring_2d_list only takes list as an argument')
        return

    for ele in val:
        if isstring_list(ele) is False:
            return False

    return True
