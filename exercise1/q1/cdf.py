def cdf(sample):
    x = list()
    y = list()
    ls = sample.tolist()    
    ls.sort()
    size = len(ls)
    for index, number in enumerate(ls):
        x.append(number)
        y.append((index + 1) / size)
    return x,y
