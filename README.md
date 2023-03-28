# ZZBase

[![CI Status](https://img.shields.io/travis/CZ410/ZZBase.svg?style=flat)](https://travis-ci.org/CZ410/ZZBase)
[![Version](https://img.shields.io/cocoapods/v/ZZBase.svg?style=flat)](https://cocoapods.org/pods/ZZBase)
[![License](https://img.shields.io/cocoapods/l/ZZBase.svg?style=flat)](https://cocoapods.org/pods/ZZBase)
[![Platform](https://img.shields.io/cocoapods/p/ZZBase.svg?style=flat)](https://cocoapods.org/pods/ZZBase)
## Foundation

**Array**

```
    /// 防止数组越界
    subscript(index: Int, safe: Bool) -> Element?
    
    func zz_objAt(index:Int) -> Element? 
    
    /// 获取一个元素的Index
    func zz_index(of object: Element) -> Int? 
    
    /// 删除一个元素
    mutating func zz_remove(_ obj: Element) 
    
    mutating func zz_remove(_ index: Int)
    
    /// 获取数组中元素的 某一个属性值
    func zz_subValues(_ keyValue:((_ element:Element) -> String?)) -> [String] 
    
    /// 将数组字符串拼接成一个字符串 用 splice 隔开
    func zz_join(_ splice: String, block:@escaping ((Element) -> String)) -> String
    
    func zz_sub(to index: Int) -> [Element]
    
    func zz_sub(frome index: Int) -> [Element]
    
    func zz_sub(in range: NSRange) -> [Element

    /// 将数组字符串拼接成一个字符串 用 splice 隔开 Element == String
    func zz_join(_ splice: String) -> String
```

**Bundle**

```
    /// APP名字
    static var zz_bundleName: String
    
    /// APP BundleIdentifier e.g. "com.ibireme.MyApp"
    static var zz_bundleID: String
    
    /// APP版本
    static var zz_appVersion: String
    
    /// APP Build
    static var zz_appBuild: String 
    
    /// 是否有新版本号
    static var zz_isNewFeature: Bool
```

**Data**

```
    var bytes: [UInt8]
    
    var zz_md2: String
    
    var zz_md2Data: Data
    
    var zz_md4: String
    
    var zz_md4Data: Data
    
    var zz_md5: String
    
    var zz_md5Data: Data
    
    var zz_utf8Str: String
```

**Date**

```
    static func zz_comps(type:Calendar.Component, date: Date = Date()) -> Int 
    
    static func zz_year(date: Date = Date()) -> Int
    
    static func zz_month(date: Date = Date()) -> Int
    
    static func zz_day(date: Date = Date()) -> Int
    
    static func zz_hour(date: Date = Date()) -> Int
    
    static func zz_minute(date: Date = Date()) -> Int
    
    static func zz_second(date: Date = Date()) -> Int
    
    static func zz_weekday(date: Date = Date()) -> Int
    
    static func zz_today(_ formatter:String) -> String
    
    /// 年
    var zz_year: String 
    
    /// 月
    var zz_month: String 
    
    /// 日
    var zz_day: String 
    
    /// 小时
    var zz_hour: String 
    
    /// 分
    var zz_minute: String
    
    /// 秒
    var zz_seconds: String
    
    /// 星期几 1:星期日 ～～～ 7：星期六
    var zz_weekDay: Int
    
    /// 当前时间是否是今天
    var zz_isToday: Bool
    
    ///  当前年是否是闰年
    var zz_isLeapYear: Bool
    
    /// 时间戳  精确到毫秒
    var zz_timeStamp: TimeInterval
    
    /// 星期几 自定义中文标题（周一/星期一/礼拜一）
    func zz_weekDay(title: String? = "星期") -> String
    
    /// 比较当前时间和另一个时间的前后
    func zz_compare(date: Date, formatter: String = "yyyy-MM-dd HH:mm:ss") -> ComparisonResult
    
    /// 一个月有多少天
    func zz_monthTotalDays(calendar: Calendar = Calendar.current) -> Int
    
    /// 根据date获取偏移指定天数的date year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    func zz_year(offset: Int, calendar: Calendar = Calendar.current) -> Date?
    
    /// 根据date获取偏移指定月数的date year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    func zz_month(offset: Int, calendar: Calendar = Calendar.current) -> Date?
    
    /// 根据date获取偏移指定天数的date year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    func zz_day(offset: Int, calendar: Calendar = Calendar.current) -> Date?
    
    /// 将Date转成字符串
    func zz_dateString(_ formatterStr: String, calendar: Calendar.Identifier? = nil) -> String
    
    /// 时间戳转时间
    static func zz_dateString(_ timeStamp: TimeInterval, to formatter: String = "yyyy-MM-dd", calendar: Calendar.Identifier? = nil) -> String
    
    /// 字符串转Date
    static func zz_date(_ dateStr: String, formatter: String = "yyyy-MM-dd", calendar: Calendar.Identifier? = nil) -> Date?
    
    ///  将一个时间格式的时间转换成另一个时间格式的时间
    static func zz_date(_ dateStr: String, formatter: String, changeTo changeToFormatter: String) -> String?
    
    /// 判断两个时间年月日是否相等
    func zz_equalDay(day: Date) -> Bool
    
    /// 将Date对象转成app需要的时间格式的字符串 "刚刚" "\(seconds/60)分钟前" "\(seconds/3600)小时前" "昨天 HH:mm"
    func zz_dateToRequiredTimeStr(calendar: Calendar = Calendar.current) -> String
    
    /// 农历月
    var zz_chineseMonth: String
    
    /// 农历日
    var zz_chineseDay: String
    
    /// 时辰
    var zz_chineseHour: String
```

**Dictionary**

```
    mutating func zz_append(dic:Dictionary) -> Void
    
    var zz_allKeys: [Key] 
```

**NSObject+KVO**

```
    func zz_addObservers(_ keyPaths:[String], key: String = "", options: NSKeyValueObservingOptions = [.old,.new], block:@escaping NSObject.ObserverBlockTargetAlias) 

    func zz_addObserver(_ keyPath: String, key: String = "", options: NSKeyValueObservingOptions = [.old,.new], block:@escaping NSObject.ObserverBlockTargetAlias)

    func zz_removeObserver(_ keyPath: String, key: String)

    func zz_removeObservers(_ keyPaths: [String], key: String)
    
    func zz_removeObserver(_ keyPath: String)

    func zz_remoAllObservers()
```

**NSObject Runtime Set Get**

```
     func zz_objc_set(key: String, _ newValue: Any?,_ policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    func zz_objc_get<T>( key: String, _ type: T.Type) -> T?
```

**String**

```
    
    var zz_md5: String
    
    /// base64编码
    var zz_base64Encoded: String?
    
    /// base64解码
    var zz_base64Decoded: String?
    
    /// utf-8 Data
    var zz_utf8: Data?
    
    /// 16进制字符串转Data
    var zz_hex: Data?
    
    var zz_last: String
    
    var zz_first: String
    
    var zz_pinyin: String
    
    var zz_formatJson: String 

    var zz_intValue: Int
    
    var zz_doubleValue: Double
    
    var zz_floatValue: CGFloat 
    
    /// 判断是否是小数
    var zz_isFloat: Bool

    /// 计算是否是整数
    var zz_isInt: Bool 
    
    /// 判断是否是手机号码
    var zz_isPhone: Bool

    /// 是否是固话
    var zz_isTelPhone: Bool 

    /// 判断是否是身份证号码
    var zz_isIdCard: Bool
    
    ///判断是否是6位验证码
    var zz_isCode_6: Bool
    
    /// 是否是IP地址
    var zz_isIP: Bool

    /// 判断是否是邮箱
    var zz_isEmail:Bool 

    /// 判断是否是中文
    var zz_isChinese:Bool 

    /// 判断是否是链接
    var zz_isURL:Bool 
    
    /// 计算文字的Size
    func zz_textSize(font: UIFont, maxSize: CGSize) -> CGSize
    
    func zz_sub(from index: Int) -> String 
    
    func zz_sub(to index: Int) -> String 
    
    func zz_sub(range index: NSRange) -> String
    
    func zz_sub(from: Int, length: Int) -> String
    
    func zz_hidden(range index: NSRange, replace: String = "*") -> String
    
    /// 替换length之后文本
    func zz_replace(from index: Int, to toString:String = "") -> String
    
    /// 将字符串每隔数位用分割符隔开 如将【123456】分割成【123,456】
    func zz_partition(gap: Int = 3, seperator: Character = ",") -> String 
    
    /// 判断字符位数是否在区间内
    func zz_isLength(min:Int, max:Int)  -> Bool
    
     /// 添加HTML结构
    var zz_addHtml: String
    
    ///  将字符串转换成HTML富文本
    func zz_htmlAttri(font: UIFont? = UIFont.systemFont(ofSize: 16), lineSpacing: CGFloat? = 10) -> NSMutableAttributedString
```

## UI

**UIDevice**

```
    /// UUID
    static var zz_uuid: String
    
    /// 用户手机别名
    static var zz_phoneName: String
    
    /// 设备名称
    static var zz_systemName: String 

    /// 设备系统版本
    static var zz_systemVersion: String 

    /// 是否是iPhone X
    static var zz_isIPhoneX: Bool

    /// 是否是 iphone5 及以下
    static var zz_isIphone5OrLess: Bool 

    /// 是否是iPad
    static var zz_isIpad: Bool

    /// 是否是iPhone
    static var zz_isIphone: Bool 

    /// 是否是暗黑模式
    static var zz_isDarkModel: Bool
    
    /// 是否是Retina
    static var zz_isRetina: Bool
    
    /// 是否是模拟器
    static var zz_isSimuLator: Bool
    
    /// 设备磁盘
    static func zz_disk(_ key: FileAttributeKey) -> String?
    
    /// 设备总磁盘空间
    static var zz_diskSpace: Int
    
    /// 设备剩余磁盘空间
    static var zz_diskSpaceFree: Int 
    
    /// 设备已用磁盘空间
    static var zz_diskSpaceUsed: Int 
```

**CALayer**

```
    /// 删除所有的子Layer
    func zz_removeAllSubLayers()
    var zz_x: CGFloat
    var zz_y : CGFloat
    var zz_width : CGFloat
    var zz_height: CGFloat
    var zz_maxX: CGFloat
    var zz_maxY: CGFloat 
    var zz_size: CGSize
    var zz_origin : CGPoint
    var zz_center: CGPoint
    var zz_centerX: CGFloat
    var zz_centerY: CGFloat
    var zz_frame: CGRect
```

**CALayer Animation**

```
    struct ZZAnimationKey {
        public var rawValue: String
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public static let  position = ZZAnimationKey(rawValue: "position") // 移动到另外一个 点(point)
        public static let  cornerRadius = ZZAnimationKey(rawValue: "cornerRadius") // 圆角动画
        public static let  transformRotation = ZZAnimationKey(rawValue: "tranform.rotation")
        public static let  transformRotationX = ZZAnimationKey(rawValue: "tranform.rotation.x")
        public static let  transformRotationY = ZZAnimationKey(rawValue: "tranform.rotation.y")
        public static let  transformRotationZ = ZZAnimationKey(rawValue: "tranform.rotation.z")
        public static let  transformScale = ZZAnimationKey(rawValue: "tranform.scale")
        public static let  transformScaleX = ZZAnimationKey(rawValue: "tranform.scale.x")
        public static let  transformScaleY = ZZAnimationKey(rawValue: "tranform.scale.y")
        public static let  transformScaleZ = ZZAnimationKey(rawValue: "tranform.scale.z")
        public static let  transformTranslationX = ZZAnimationKey(rawValue: "tranform.translation.x")
        public static let  transformTranslationY = ZZAnimationKey(rawValue: "tranform.translation.y")
        public static let  transformTranslationZ  = ZZAnimationKey(rawValue: "tranform.translation.z")
    } 
    
    /// CABasicAnimation 基础动画
    /// - Parameters:
    ///   - key: ZZAnimationKey 动画类型
    ///   - startValue: 起始值
    ///   - endValue: 结束值
    ///   - duration: 动画时间
    ///   - delay: 动画延迟时间 默认：0
    ///   - repeatCount: 动画循环次数 默认：1
    ///   - removedOnCompletion: 动画结束之后位置是否保持不变（即动画结束是否依然在startValue）默认： false
    ///   - option: 动画方式  linear: 匀速 easeIn: 慢进 easeOut: 慢出 easeInEaseOut: 慢进慢出 default: 慢进慢出 默认：default
    @discardableResult func zz_animation(key: ZZAnimationKey,
                      startValue: Any?,
                      endValue: Any?,
                      duration: TimeInterval = 2.0,
                      delay: TimeInterval = 0,
                      repeatCount: Float = 1,
                      removedOnCompletion: Bool = false,
                      option: CAMediaTimingFunctionName = .default) -> CABasicAnimation
    
    /// CAKeyframeAnimation 基础动画
    /// - Parameters:
    ///   - key: ZZAnimationKey 动画类型
    ///   - values: 关键帧数组对象，里面每一个元素即为一个关键帧，动画会在对应的时间段内，依次执行数组中每一个关键帧的动画
    ///   - keyTimes: 设置关键帧对应的时间点，范围：0-1。如果没有设置该属性，则每一帧的时间平分
    ///   - duration: 动画时间
    ///   - delay: 动画延迟时间
    ///   - repeatCount: 动画循环次数
    ///   - path: 动画路径
    ///   - removedOnCompletion: 动画结束之后位置是否保持不变 默认： false
    ///   - option: 动画方式
    ///   - rotationMode: 旋转方式
    @discardableResult func zz_animation(key: ZZAnimationKey,
                      values: [Any]?,
                      keyTimes: [NSNumber]?,
                      duration: TimeInterval = 2.0,
                      delay: TimeInterval = 0,
                      repeatCount: Float = 1,
                      path: CGPath? = nil,
                      removedOnCompletion: Bool = false,
                      option: CAMediaTimingFunctionName = .default,
                      rotationMode: CAAnimationRotationMode? = nil) -> CAKeyframeAnimation
    
    /// CASpringAnimation 基础动画  弹簧效果
    /// - Parameters:
    ///   - key: ZZAnimationKey 动画类型
    ///   - toValue: 终点位置
    ///   - delay: 延迟时间
    ///   - mass:  质量（影响弹簧的惯性，质量越大，弹簧惯性越大，运动的幅度越大）
    ///   - stiffness: 弹性系数（弹性系数越大，弹簧的运动越快）
    ///   - damping: 阻尼系数（阻尼系数越大，弹簧的停止越快）
    ///   - initialVelocity: 初始速率（弹簧动画的初始速度大小，弹簧运动的初始方向与初始速率的正负一致，若初始速率为0，表示忽略该属性）
    ///   - repeatCount: 动画执行的次数
    ///   - removedOnCompletion: 运动后的位置保持不变（layer的最后位置是toValue）
    ///   - option: 动画的时间节奏控制 方式
    @discardableResult func zz_animation(key: ZZAnimationKey,
                      toValue: Any?,
                      delay: TimeInterval = 0,
                      mass: CGFloat = 10.0,
                      stiffness: CGFloat = 50,
                      damping: CGFloat = 100.0,
                      initialVelocity: CGFloat = 5,
                      repeatCount: Float = 1,
                      removedOnCompletion: Bool = false,
                      option: CAMediaTimingFunctionName = .default) -> CASpringAnimation
    
    /// CAAnimationGroup 的基类动画
    /// - Parameters:
    ///   - animations: 动画组
    ///   - duration: 动画时长
    ///   - delay: 动画时长
    ///   - repeatCount: 重复次数
    ///   - removedOnCompletion: 运动后的位置保持不变（layer的最后位置是toValue）
    ///   - option:  动画的时间节奏控制 方式
    @discardableResult func zz_animation_group(_ animations: [CAAnimation]?,
                            duration: TimeInterval = 2.0,
                            delay: TimeInterval = 0,
                            repeatCount: Float = 1,
                            removedOnCompletion: Bool = false,
                            option: CAMediaTimingFunctionName = .default) -> CAAnimationGroup 
```

**UIApplication**

```
    /// "Documents" folder in this app's sandbox.
    static var zz_document_url: URL?
    
    static var zz_document_path: String
    
    /// "Caches" folder in this app's sandbox.
    static var zz_caches_url: URL?
    
    static var zz_caches_path: String
    
    /// "Library" folder in this app's sandbox.
    static var zz_library_url: URL?
    
    static var zz_library_path: String{
```

**UICollectionView**

```
     @discardableResult func zz_register<T>(cell cellClass: T.Type, nibName: String? = nil, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> Self where T: UICollectionViewCell
    
    @discardableResult func zz_register<T>(header headerClass: T.Type, nibName: String? = nil, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> Self where T: UICollectionReusableView
    
    @discardableResult func zz_register<T>(footer headerClass: T.Type, nibName: String? = nil, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> Self where T: UICollectionReusableView

    func zz_cell<T: UICollectionViewCell>(_ identifier: String = "\(NSStringFromClass(T.self))_identifier",
                 cellClass: T.Type,
                 indexPath: IndexPath) -> T 
    
    func zz_dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, withReuseIdentifier identifier: String = "\(NSStringFromClass(T.self))_identifier", for indexPath: IndexPath, classType: T.Type) -> T

    func zz_header<T: UICollectionReusableView>(_ classType: T.Type, for indexPath: IndexPath, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> T

    func zz_footer<T: UICollectionReusableView>(_ classType: T.Type, for indexPath: IndexPath, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> T
```

**UITableView**

```
    @discardableResult
    func zz_register<T>(cell cellClass: T.Type, nibName: String? = nil, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> Self where T: UITableViewCell
    
    @discardableResult
    func zz_register<T>(headerFooter cellClass: T.Type, nibName: String? = nil, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> Self where T: UITableViewHeaderFooterView
    
    func zz_cell(_ style:UITableViewCell.CellStyle = .default, initBlock: ((_ cell: UITableViewCell) -> Void)? = nil) -> UITableViewCell 
    
    func zz_cell<T: UITableViewCell>(identifier: String = "\(NSStringFromClass(T.self))_identifier",
                  cellClass:T.Type,
                  for indexPath: IndexPath) -> T
    
    func zz_cell<T: UITableViewCell>(identifier: String = "\(NSStringFromClass(T.self))_identifier",
                  cellClass:T.Type,
                  style:UITableViewCell.CellStyle = .default,
                  initBlock:((_ cell:T) -> Void)? = nil) -> T

    func zz_headerFooter<T: UITableViewHeaderFooterView>(identifier: String = "\(NSStringFromClass(T.self))HeaderFooter_identifier",
        headerFooterClass: T.Type,
        initBlock:((_ cell:T) -> Void)? = nil) -> T
```

**UIColor**

```
     var r: CGFloat
    
    var g: CGFloat
    
    var b: CGFloat
    
    var a: CGFloat
    
    
    /// 暗黑模式颜色
    static func zz_darkColor(_ light: UIColor,_ dark: UIColor) -> UIColor
    
    
    /// Color RGB
    static func zz_rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor
    
    /// HEXColor
    static func zz_hex(_ hexStr: String, alpha: CGFloat = 1) -> UIColor
    
    ///  获取颜色的RGB
    func zz_rgba() -> (r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) 
    
    /// 修改颜色的透明度
    func zz_alpha(_ alpha: CGFloat) -> UIColor
    
    /// 修改颜色的透明度
    static func zz_alpha(_ color: UIColor, alpha: CGFloat) -> UIColor
    
    
    /// 过渡颜色到指定颜色
    func zz_transition(to color: UIColor, progress: CGFloat) -> UIColor 
    
    /// 生成一个随机色
    static func zz_random() -> UIColor
```

**UIControl**

```
      /// 添加事件
    @discardableResult func zz_addBlock(for events:UIControl.Event, block:@escaping ((_ sender: Any) -> Void)) -> Self

    @discardableResult func zz_addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self

    /// 删除通过block绑定的事件
    @discardableResult func zz_removeBlockTarget(for events: UIControl.Event) -> Self

    /// 删除所有的点击事件
    @discardableResult func zz_removeAllTarget() -> Self
 
    var zz_isEnabled: Bool
    
    @discardableResult func zz_isEnabled(_ enable: Bool) -> Self
    
    var zz_isSelected: Bool
    
    @discardableResult func zz_isSelected(_ selected: Bool) -> Self
```

**UIImage**

```
    /// 不透明度
    var opaque: Bool
    
    /// 取图片 UIImage.init(named: name)
    static func zz_named(_ name:String) -> UIImage?
    
    /// base64转图片
    static func zz_base64(_ base64:String) -> UIImage?

    /// 使用颜色绘制一张图片
    static func zz_image(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? 

    /// 截取View图片
    static func zz_snapshot(_ fromeView:UIView?, in frame:CGRect) -> UIImage?
            
    /// 修改图片的颜色
    func zz_image(tintColor:UIColor, blendMode: CGBlendMode = .destinationIn, alpha: CGFloat = 1) -> UIImage? 
    
    /// 图片修改成圆角
    func zz_roundCorner(_ byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGFloat) -> UIImage? 
    
    /// 图片修改成圆角
    func zz_roundCorner(_ byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGSize) -> UIImage?
    
    /// 旋转 翻折图片
    func zz_image(orientation: UIImage.Orientation) -> UIImage
    
    /// 水平翻转图片
    func zz_filp() -> UIImage 

    /// 向右旋转90° ⤼
    func zz_rotateRight90() -> UIImag
    
    /// 等比率缩放
    func zz_scale(_ scaleSize: CGFloat) -> UIImage? 
    
    /// 按照比例拉伸图片
    func zz_resizable(_ widthScale: CGFloat,_  heightScale: CGFloat) -> UIImage
    
    /// 根据图片宽度重置图片大小
    func zz_resize_w(_ width: CGFloat) -> UIImage? 
    
    /// 根据图片高度重置图片大小
    func zz_resize_h(_ height: CGFloat) -> UIImage? 
    
    /// 重置图片大小 自动根据最大边长适配
    func zz_resize(_ maxWidthOrHeight: CGFloat) -> UIImage? 
    
    /// 重设图片大小
    func zz_resize(_ reSize:CGSize) -> UIImage?
    
    /// 剪切图片
    func zz_cropping(in rect: CGRect) -> UIImage?
    
    /// 生成一张二维码
    static func zz_qrImage(_ content: String, size: CGSize = CGSize(100) , onColor: UIColor = .black, offColor: UIColor = .white) -> UIImage?
    
    /// 压缩图片数据-不压尺寸
    func zz_compress(_ maxLength: Int) -> Data?
    
    /// 压缩图片
    func zz_compress_mid(_ maxLength: Int) -> Data?
    
    /// 压缩图片
    func zz_compress_image(_ maxLength: Int) -> UIImage? 
    
    /// 给图片打上 文字
    func zz_draw(text: String, attributed: [NSAttributedString.Key: Any], scale: CGFloat) -> UIImage
```


**UIView**

```
   
    var zz_x: CGFloat
    var zz_y : CGFloat
    var zz_width : CGFloat
    var zz_height: CGFloat 
    var zz_maxX: CGFloat
    var zz_maxY: CGFloat
    var zz_size: CGSize 
    var zz_origin : CGPoint
    var zz_center: CGPoint
    var zz_centerX: CGFloat 
    var zz_centerY: CGFloat
    var zz_frame: CGRect
    var zz_alpha: CGFloat 
    var zz_borderColor: UIColor
    var zz_borderWidth: CGFloat
    var zz_cornerRadius: CGFloat
    var zz_masksToBounds: Bool
    var zz_backgroundColor: UIColor?
    var zz_isUserInteractionEnabled: Bool
    var zz_isHidden: Bool
    
    @discardableResult func zz_border(width: CGFloat = 0.5, color: UIColor = UIColor.gray, radius: CGFloat? = nil) -> Self
    
    @discardableResult func zz_addSubView(_ view: UIView) -> Self
    
    @discardableResult func zz_addSubView(_ view: UIView, constraint: NSLayoutConstraint) -> Self
    
    @discardableResult func zz_addSubView(_ view: UIView, constraints: [NSLayoutConstraint]) -> Self
    
    /// 一次添加多个子控件
    @discardableResult func zz_addSubViews(subviews:[UIView]) -> Self 
    
    @discardableResult func zz_addSubViews(subviews:[UIView], constraints: [NSLayoutConstraint]) -> Self 
    
    @discardableResult func zz_insertSubView(_ view: UIView, at index: Int) -> Self
    
    @discardableResult func zz_insertSubView(_ view: UIView, belowSubview: UIView) -> Self
    
    @discardableResult func zz_insertSubView(_ view: UIView, aboveSubview: UIView) -> Self
    
    /// 删除所有的字窗体
    func zz_removeAllSubViews()
    
    /// 删除本窗体中 选中的子窗体
    func zz_remove(_ subViews: [UIView])
    
    /// 找到本窗体中的
    func zz_find<T: UIView>(_ Class: T.Type) -> T? 
    
    /// 查找当前View是否包含view
    func zz_isHave(view: UIView) -> Bool
    
    /// 找到当前控件所在的控制器
    func zz_getCurrentViewCtrl() -> UIViewController?
    
    @discardableResult func zz_addTap(target: Any?, action: Selector?) -> Self
    
    /// 添加事件
    @discardableResult func zz_addTap(block:@escaping ((_ sender: Any) -> Void)) -> Self
    
    /// 删除通过 zz_addTap 绑定的事件
    @discardableResult func zz_removeTap() -> Self
    
     ///  移除渐变层
    func zz_removeGradient()
    
    /// 添加一个渐变层  通过KVO监听父试图Frame变化自动改变渐变层Layer的大小
    /// - Parameters:
    ///   - colors: 颜色组
    ///   - startPoint: 开始位置x,y 在 0～1 之间
    ///   - endPoint: 结束位置x,y  在 0～1 之间
    ///   - locations: 渐变不同颜色位置 对应颜色组 0～1之间
    @discardableResult func zz_addGradient(colors: [Any]?, start startPoint: CGPoint = CGPoint(x: 0, y: 0.5), end endPoint:CGPoint = CGPoint(x: 1, y: 0.5), locations: [NSNumber] = [0, 1]) -> CAGradientLayer

    /// 添加一个渐变层  通过KVO监听父试图Frame变化自动改变渐变层Layer的大小， 在
    /// - Parameters:
    ///   - fColor: 开始颜色
    ///   - toColor: 结束颜色
    ///   - startPoint: 开始位置x,y 在 0～1 之间
    ///   - endPoint: 结束位置x,y  在 0～1 之间
    ///   - locations: 渐变不同颜色位置 对应颜色组 0～1之间
    @discardableResult func zz_addGradient(form fColor: UIColor,to toColor: UIColor,start startPoint: CGPoint = CGPoint(x: 0, y: 0.5), end endPoint:CGPoint = CGPoint(x: 1, y: 0.5), locations: [NSNumber] = [0, 1]) -> CAGradientLayer
    
    /// 圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角
    ///   - radii: 圆角半径
    @discardableResult func zz_round(_ corners: UIRectCorner, radii: CGFloat) -> Self
```

**UIViewController**

```
     /// NavigationController BackgroundImage
    var zz_navBarBgImg: UIImage? 
    
    /// Set NavigationController BackgroundImage
    @discardableResult func zz_navBarBgImg(_ img: UIImage?) -> Self
    
    /// NavigationController ShadowImage
    var zz_shadowImag: UIImage?
    
    /// Set NavigationController ShadowImage
    @discardableResult func zz_shadowImag(_ img: UIImage?) -> Self
    
    /// NavigationController ShadowImage
    var zz_titleColor: UIColor?
    
    /// Set NavigationController ShadowImage
    @discardableResult func zz_titleColor(_ color: UIColor?) -> Self
    
    /// NavigationController TitleText Font
    var zz_titleFont: UIFont?
    
    /// Set NavigationController TitleText Font
    @discardableResult func zz_titleFont(_ font: UIFont?) -> Self
```

## CG

**CGFloat**

```
    static let zz_max = CGFloat(MAXFLOAT)
```

**CGPoint**

```
    init(_ value: CGFloat)
    
    init(zz_x: CGFloat = 0, zz_y: CGFloat = 0)
    
    var zz_x : CGFloat
    
    @discardableResult mutating func zz_x(_ value: CGFloat) -> Self
    
    var zz_y : CGFloat 
    
    @discardableResult mutating func zz_y(_ value: CGFloat) -> Self
    
    static func += (left:inout CGPoint, right: CGPoint)

    static func -= (left:inout CGPoint, right: CGPoint)

    static func + (left:CGPoint, right: CGPoint) -> CGPoint

    static func - (left:CGPoint, right: CGPoint) -> CGPoint
```

**CGRect**

```
    init(zz_x: CGFloat = 0, zz_y: CGFloat = 0, zz_w: CGFloat = 0, zz_h: CGFloat = 0) 
    
    var zz_x : CGFloat 
    
    @discardableResult mutating func zz_x(_ value: CGFloat) -> Self{
    
    var zz_y : CGFloat 
    
    @discardableResult mutating func zz_y(_ value: CGFloat) -> Self
    
    var zz_width : CGFloat 
    
    @discardableResult mutating func zz_width(_ value: CGFloat) -> Self
    
    var zz_height : CGFloat 
    
    @discardableResult mutating func zz_height(_ value: CGFloat) -> Self

    static func += (left:inout CGRect, right: CGRect)
    static func -= (left:inout CGRect, right: CGRect)
    static func + (left:CGRect, right: CGRect) -> CGRect
    static func - (left:CGRect, right: CGRect) -> CGRect
```


**CGSize**

```
    init(_ value: CGFloat)
    
    init(zz_w width: CGFloat = 0, zz_h height: CGFloat = 0) 
    
    var zz_width : CGFloat 
    
    @discardableResult mutating func zz_width(_ value: CGFloat) -> Self
    
    var zz_height : CGFloat 
    
    @discardableResult mutating func zz_height(_ value: CGFloat) -> Self

    static func += (left:inout CGSize, right: CGSize)
    static func -= (left:inout CGSize, right: CGSize)
    static func + (left:CGSize, right: CGSize) -> CGSize
    static func - (left:CGSize, right: CGSize) -> CGSize
```

**UIEdgeInsets**

```
    init(zz_top: CGFloat = 0, zz_left: CGFloat = 0, zz_bottom: CGFloat = 0, zz_right: CGFloat = 0) 
    
    var zz_top : CGFloat
    
    @discardableResult mutating func zz_top(_ value: CGFloat) -> Self
    
    var zz_left : CGFloat
    
    @discardableResult mutating func zz_left(_ value: CGFloat) -> Self
    
    var zz_bottom : CGFloat 
    
    @discardableResult mutating func zz_bottom(_ value: CGFloat) -> Self
    
    var zz_right : CGFloat
    
    @discardableResult mutating func zz_right(_ value: CGFloat) -> Self

    static func += (left:inout UIEdgeInsets, right: UIEdgeInsets)
    static func -= (left:inout UIEdgeInsets, right: UIEdgeInsets)
    static func + (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets
    static func - (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets
    
```
![Image text](https://github.com/CZ410/ZZBase/blob/main/Images/data.png)

[基于ZZBase的一些自定义组件ZZCustomControl](https://github.com/CZ410/ZZCustomControl)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ZZBase is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZZBase'
```

## Author

CzzBoom, 1039776732@qq.com

## License

ZZBase is available under the MIT license. See the LICENSE file for more info.
