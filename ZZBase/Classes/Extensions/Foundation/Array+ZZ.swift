//
//  Array+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/3.
//

import Foundation

public extension Array {
    
    /// 防止数组越界
    subscript(index: Int, safe: Bool) -> Element? {
        if safe {
            if index < 0 { return nil}
            if self.count > index {
                return self[index]
            }
            else {
                return nil
            }
        }
        else {
            return self[index]
        }
    }
    
    func zz_objAt(index:Int) -> Element? {
        return self[index,true]
    }
    
    func zz_index(of object: Element) -> Int? where Element: Equatable{
        let index = self.firstIndex(where: {$0 == object})
        return index
    }
    
    mutating func zz_remove(_ obj: Element) where Element: Equatable{
        guard let index = zz_index(of: obj) else { return }
        zz_remove(index)
    }
    
    mutating func zz_remove(_ index: Int){
        if index >= count{
            return
        }
        self.remove(at: index)
    }
    
    /// 获取数组中元素的 某一个属性值
    func zz_subValues(_ keyValue:((_ element:Element) -> String?)) -> [String] {
        var arr: [String] = []
        for index in 0 ..< self.count {
            if let subValue = self.zz_objAt(index: index){
                if let e = keyValue(subValue){
                    arr.append(e)
                }
            }
        }
        return arr
    }
    
    /// 将数组字符串拼接成一个字符串 用 splice 隔开
    /// - Parameters:
    ///   - splice: 隔开element间的字符
    ///   - block: 拼接数据
    /// - Returns: 拼接完成的字符串
    func zz_join(_ splice: String, block:@escaping ((Element) -> String)) -> String{
        var jointString: String = ""
        var isFirst: Bool = true
        self.forEach({
            if !isFirst {
                jointString.append(splice)
            }
            let string = block($0)
            jointString.append(string)
            isFirst = false
        })
        return jointString
    }
    
    func zz_sub(to index: Int) -> [Element]{
        
        if self.count <= (index + 1) {
            return self
        }
        var arr:[Element] = []
        for i in 0 ... index {
            arr.append(self[i])
        }
        return arr
    }
    
    func zz_sub(frome index: Int) -> [Element]{
        guard self.count > index else {
            return []
        }
        var arr:[Element] = []
        for i in index ..< self.count {
            arr.append(self[i])
        }
        return arr
    }
    
    func zz_sub(in range: NSRange) -> [Element]{
        if self.count < (range.location + 1){
            return []
        }
        
        if self.count > (range.location + 1) && self.count < (range.location + range.length + 1){
            return self.zz_sub(frome: range.location)
        }
        
//        if self.count > (range.location + range.length + 1) {
//            return self.sub(to: range.location + range.length)
//        }
        
        var arr:[Element] = []
        for i in range.location ..< (range.location + range.length) {
            arr.append(self[i])
        }
        return arr
        
    }
}

extension Array where Element == String{
    /// 将数组字符串拼接成一个字符串 用 splice 隔开
    /// - Parameter splice: 隔开element间的字符
    /// - Returns: 拼接完成的字符串
    func zz_join(_ splice: String) -> String{
        var jointString: String = ""
        var isFirst: Bool = true
        self.forEach({
            if !isFirst {
                jointString.append(splice)
            }
            jointString.append($0)
            isFirst = false
        })
        return jointString
    }

}
