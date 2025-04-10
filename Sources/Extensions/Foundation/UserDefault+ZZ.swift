//
//  UserDefault+ZZ.swift
//  Pods
//
//  Created by 陈钟 on 2025/4/9.
//

@propertyWrapper
public struct ZZUserDefaults<T> {
    public let key: String
    public let defaultValue: T
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public  var wrappedValue: T{
        set{
            UserDefaults.zz_set(newValue, forKey: key)
            UserDefaults.zz_synchronize()
        }
        get{
            return UserDefaults.zz_object(forKey: key) as? T ?? defaultValue
        }
    }
    
}

public extension UserDefaults{
    static func zz_synchronize(){
        UserDefaults.standard.synchronize()
    }
    
    static func zz_object(forKey defaultName: String) -> Any?{
        return UserDefaults.standard.object(forKey: defaultName)
    }
    
    static func zz_set(_ value: Any?, forKey defaultName: String){
        return UserDefaults.standard.set(value, forKey: defaultName)
    }
    
    static func zz_removeObject(forKey defaultName: String){
        UserDefaults.standard.removeObject(forKey: defaultName)
    }
    
    static func zz_string(forKey defaultName: String) -> String?{
        return UserDefaults.standard.string(forKey: defaultName)
    }
    
    static func zz_array(forKey defaultName: String) -> [Any]?{
        return UserDefaults.standard.array(forKey: defaultName)
    }
    
    static func zz_dictionary(forKey defaultName: String) -> [String : Any]?{
        return UserDefaults.standard.dictionary(forKey: defaultName)
    }
    
    static func zz_data(forKey defaultName: String) -> Data?{
        return UserDefaults.standard.data(forKey: defaultName)
    }
    
    static func zz_stringArray(forKey defaultName: String) -> [String]?{
        return UserDefaults.standard.stringArray(forKey: defaultName)
    }
    
    static func zz_integer(forKey defaultName: String) -> Int{
        return UserDefaults.standard.integer(forKey: defaultName)
    }
    
    static func zz_float(forKey defaultName: String) -> Float{
        return UserDefaults.standard.float(forKey: defaultName)
    }
    
    static func zz_double(forKey defaultName: String) -> Double{
        return UserDefaults.standard.double(forKey: defaultName)
    }
    
    static func zz_bool(forKey defaultName: String) -> Bool{
        return UserDefaults.standard.bool(forKey: defaultName)
    }
    
    static func zz_url(forKey defaultName: String) -> URL?{
        return UserDefaults.standard.url(forKey: defaultName)
    }
    
    static func zz_set(_ value: Int, forKey defaultName: String){
        return UserDefaults.standard.set(value, forKey: defaultName)
    }
    
    static func zz_set(_ value: Float, forKey defaultName: String){
        return UserDefaults.standard.set(value, forKey: defaultName)
    }
    
    static func zz_set(_ value: Double, forKey defaultName: String){
        return UserDefaults.standard.set(value, forKey: defaultName)
    }
    
    static func zz_set(_ value: Bool, forKey defaultName: String){
        return UserDefaults.standard.set(value, forKey: defaultName)
    }
    
    static func zz_set(_ url: URL?, forKey defaultName: String){
        return UserDefaults.standard.set(url, forKey: defaultName)
    }
}
