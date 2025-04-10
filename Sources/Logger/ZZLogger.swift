//
//  ZZLogger.swift
//  Pods
//
//  Created by 陈钟 on 2025/4/9.
//

public struct ZZLogger{
    public static func msg<T>(_ message: T, type: String? = nil, file:String = #file, funcName:String = #function,lineNum:Int = #line){
#if DEBUG
        // 设置在DEBUG 环境下打印LOG ， DEBUG就是在Build Settings 里面设置的标识。
        // 1.获取打印所在的文件
        let file = (file as NSString).lastPathComponent
        //    //2.获取打印所在的方法
        let funcName = funcName
        //3.获取打印所在的行
        let lineNum = lineNum
        type != nil ? print(type!) : nil
        print("\(file) \(funcName) [\(lineNum)]: \(message)")
        type != nil ? print(type!) : nil
#endif
    }
    
    public static func success<T>(_ message: T, file:String = #file, funcName:String = #function,lineNum:Int = #line){
        msg(message, type: "\n========================🍏🍏🍏========================\n", file: file, funcName: funcName, lineNum: lineNum)
    }
    
    public static func info<T>(_ message: T, file:String = #file, funcName:String = #function,lineNum:Int = #line){
        msg(message, type: "\n========================🩵🩵🩵========================\n", file: file, funcName: funcName, lineNum: lineNum)
    }
    
    public static func warning<T>(_ message: T, file:String = #file, funcName:String = #function,lineNum:Int = #line){
        msg(message, type: "\n========================⚠️⚠️⚠️========================\n", file: file, funcName: funcName, lineNum: lineNum)
    }
    
    public static func error<T>(_ message: T, file:String = #file, funcName:String = #function,lineNum:Int = #line){
        msg(message, type: "\n========================❌❌❌========================\n", file: file, funcName: funcName, lineNum: lineNum)
    }
    
    
    
}
