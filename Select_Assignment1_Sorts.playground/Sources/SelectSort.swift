import Foundation

public func selectSort(list: [Int]) ->[Int]{
    guard list.count > 1 else {return list}
    var a = list
    for x in 0..<a.count-1{
        var lowest = x
        for y in x + 1 ..< a.count {
            if a[y] < a[lowest]{
                lowest = y;
            }
        }
        
        if x != lowest{
            a.swap(x, index2: lowest)
        }
    }
    return a;
}
