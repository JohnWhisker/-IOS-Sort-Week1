import Foundation

public func quickSort<T: Comparable>(list: [T])->[T]{
    guard list.count>1 else {return list}
    let privot = list[list.count/2]
    let less = list.filter {$0 < privot}
    let equal = list.filter {$0 == privot}
    let greater = list.filter {$0 > privot}
    
    return quickSort(less) + equal + quickSort(greater);
    
}


