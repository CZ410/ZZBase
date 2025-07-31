//
//  Date+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2022/12/30.
//

import Foundation

public extension Date {
    static func zz_comps(type: Calendar.Component, date: Date = Date()) -> Int {
        let calender = Calendar(identifier: .gregorian)
        let comps = calender.component(type, from: date)
        return comps
    }

    static func zz_year(date: Date = Date()) -> Int {
        return Date.zz_comps(type: .year, date: date)
    }

    static func zz_month(date: Date = Date()) -> Int {
        return Date.zz_comps(type: .month, date: date)
    }

    static func zz_day(date: Date = Date()) -> Int {
        return Date.zz_comps(type: .day, date: date)
    }

    static func zz_hour(date: Date = Date()) -> Int {
        return Date.zz_comps(type: .hour, date: date)
    }

    static func zz_minute(date: Date = Date()) -> Int {
        return Date.zz_comps(type: .minute, date: date)
    }

    static func zz_second(date: Date = Date()) -> Int {
        return Date.zz_comps(type: .second, date: date)
    }

    static func zz_weekday(date: Date = Date()) -> Int {
        return Date.zz_comps(type: .weekday, date: date)
    }

    static func zz_today(_ formatter: String) -> String {
        return Date().zz_dateString(formatter)
    }

    /// 年
    var zz_year: String {
        return zz_dateString("yyyy")
    }

    /// 月
    var zz_month: String {
        return zz_dateString("MM")
    }

    /// 日
    var zz_day: String {
        return zz_dateString("dd")
    }

    /// 小时
    var zz_hour: String {
        return zz_dateString("HH")
    }

    /// 分
    var zz_minute: String {
        return zz_dateString("mm")
    }

    /// 秒
    var zz_seconds: String {
        return zz_dateString("ss")
    }

    /// 星期几 1:星期日 ～～～ 7：星期六
    var zz_weekDay: Int {
        let calender = Calendar(identifier: .gregorian)
        let comps = calender.component(.weekday, from: self)
        return comps
    }

    /// 当前时间是否是今天
    var zz_isToday: Bool {
        return zz_equalDay(day: Date())
    }

    ///  当前年是否是闰年
    var zz_isLeapYear: Bool {
        let year = zz_year.zz_intValue
        if year % 4 == 0 && year % 100 != 0 || year % 400 == 0 {
            return true
        }
        return false
    }

    /// 时间戳  精确到毫秒
    var zz_timeStamp: TimeInterval {
        let timeInterval = timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval * 1000))
        return TimeInterval(millisecond)
    }

    /// 星期几 自定义中文标题（周一/星期一/礼拜一）
    /// - Parameter title: 自定义标题
    /// - Returns: 中文星期
    func zz_weekDay(title: String? = "星期", weekFormatter: ((Int) -> String)? = nil) -> String {
        var weekStr: String = "一"
        switch zz_weekDay {
        case 1: do { weekStr = weekFormatter?(1) ?? "日" }
        case 2: do { weekStr = weekFormatter?(2) ?? "一" }
        case 3: do { weekStr = weekFormatter?(3) ?? "二" }
        case 4: do { weekStr = weekFormatter?(4) ?? "三" }
        case 5: do { weekStr = weekFormatter?(5) ?? "四" }
        case 6: do { weekStr = weekFormatter?(6) ?? "五" }
        case 7: do { weekStr = weekFormatter?(7) ?? "六" }
        default: do { return "" }
        }
        return String(format: "%@%@", title ?? "", weekStr)
    }

    /// 比较当前时间和另一个时间的前后
    /// - Parameters:
    ///   - date: 比较时间
    ///   - formatter: 比较的时间格式 （时间将转换成该格式进行比较）
    /// - Returns: ComparisonResult
    func zz_compare(date: Date, formatter: String = "yyyy-MM-dd HH:mm:ss") -> ComparisonResult {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter

        let oneDayStr = dateFormatter.string(from: self)
        let anotherDayStr = dateFormatter.string(from: date)

        let dateOne = dateFormatter.date(from: oneDayStr)!
        let dateAnother = dateFormatter.date(from: anotherDayStr)!

        let result = dateOne.compare(dateAnother)

        return result
    }

    /// 一个月有多少天
    func zz_monthTotalDays(calendar: Calendar = Calendar.current) -> Int {
        let daysInMonth = calendar.range(of: .day, in: .month, for: self)
        return daysInMonth?.count ?? 0
    }

    /// 本月的 1 日  Ex: 2025-02-01
    func zz_firstdayOfMonth(calendar: Calendar.Identifier? = nil) -> Date? {
        zz_month(day: 1, calendar: calendar)
    }

    /// 本月最后一天
    func zz_lastdayOfMonth(calendar: Calendar.Identifier? = nil) -> Date? {
        zz_month(day: Int.max, calendar: calendar)
    }

    /// 转换成当月某天  Ex: 若小于 1 号则为 1 号，大于当月最大天数，则为当月最后一天
    func zz_month(day: Int, calendar: Calendar.Identifier? = nil) -> Date? {
        var dayCount = day
        if dayCount < 1 { dayCount = 1 }
        let maxDay = zz_monthTotalDays(calendar: .init(identifier: calendar ?? Calendar.current.identifier))
        if dayCount > maxDay {
            dayCount = maxDay
        }
        let month = zz_dateString("yyyy-MM", calendar: calendar)
        let day = month + "-" + dayCount.zz_toString(minCount: 2)
        return Self.zz_date(day, formatter: "yyyy-MM-dd", calendar: calendar)
    }

    enum DateOffsetTyp {
        case year
        case month
        case day
        case hour
        case minute
        case second
    }

    func zz_offset(_ type: DateOffsetTyp, value: Int, calendar: Calendar = Calendar.current) -> Date? {
        var comps = DateComponents()
        comps.calendar = calendar
        switch type {
        case .year:
            comps.year = value
        case .month:
            comps.month = value
        case .day:
            comps.day = value
        case .hour:
            comps.hour = value
        case .minute:
            comps.minute = value
        case .second:
            comps.second = value
        }
        let date = calendar.date(byAdding: comps, to: self)
        return date
    }

    /// 根据date获取偏移指定天数的date year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    func zz_year(offset: Int, calendar: Calendar = Calendar.current) -> Date? {
        return zz_offset(.year, value: offset, calendar: calendar)
    }

    /// 根据date获取偏移指定月数的date year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    func zz_month(offset: Int, calendar: Calendar = Calendar.current) -> Date? {
        return zz_offset(.month, value: offset, calendar: calendar)
    }

    /// 根据date获取偏移指定天数的date year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    func zz_day(offset: Int, calendar: Calendar = Calendar.current) -> Date? {
        return zz_offset(.day, value: offset, calendar: calendar)
    }

    /// 将Date转成字符串
    func zz_dateString(_ formatterStr: String, calendar: Calendar.Identifier? = nil) -> String {
        let formatter = DateFormatter()
        if let calend = calendar {
            formatter.calendar = Calendar(identifier: calend)
        }
        formatter.dateFormat = formatterStr
        return formatter.string(from: self)
    }

    /// 时间戳转时间
    /// - Parameters:
    ///   - timeStamp: 时间戳
    ///   - formatter: 转换的时间格式
    ///   - calendar: 转换的日历标识 Calendar.Identifier
    /// - Returns: 时间字符串
    static func zz_dateString(_ timeStamp: TimeInterval, to formatter: String = "yyyy-MM-dd", calendar: Calendar.Identifier? = nil) -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        return date.zz_dateString(formatter, calendar: calendar)
    }

    /// 字符串转Date
    static func zz_date(_ dateStr: String, formatter: String = "yyyy-MM-dd", calendar: Calendar.Identifier? = nil) -> Date? {
        let dateFormatter = DateFormatter()
        if let calend = calendar {
            dateFormatter.calendar = Calendar(identifier: calend)
        }
        dateFormatter.dateFormat = formatter
        return dateFormatter.date(from: dateStr)
    }

    ///  将一个时间格式的时间转换成另一个时间格式的时间
    /// - Parameters:
    ///   - dateStr: 时间字符串
    ///   - formatter: 时间字符串的时间格式
    ///   - changeToFormatter: 将要转换成的时间格式
    /// - Returns: 转换完成的时间字符串
    static func zz_date(_ dateStr: String, formatter: String, changeTo changeToFormatter: String) -> String? {
        let date = zz_date(dateStr, formatter: formatter)
        let changeTo = date?.zz_dateString(changeToFormatter)
        return changeTo
    }

    /// 判断两个时间年月日是否相等
    func zz_equalDay(day: Date) -> Bool {
        return zz_year == day.zz_year && zz_month == day.zz_month && zz_day == day.zz_day
    }

    enum DateToRequiredTimeStyle {
        case now(_ date: Date)
        case minutesAgain(_ minutes: Int, _ date: Date)
        case hoursAgain(_ hours: Int, _ date: Date)
        case yeasterday(_ date: Date)
        case thisYear(_ date: Date)
        case beforYear(_ date: Date)
    }

    typealias DateToRequiredCallback = (_ style: DateToRequiredTimeStyle) -> String

    /// 将Date对象转成app需要的时间格式的字符串 "刚刚" "\(seconds/60)分钟前" "\(seconds/3600)小时前" "昨天 HH:mm"
    func zz_dateToRequiredTimeStr(calendar: Calendar = Calendar.current, formatterCallback: DateToRequiredCallback? = nil) -> String {
        let callback = formatterCallback ?? { style in
            func formatter(_ date: Date, fomtStr: String) -> String {
                let dateFormat = DateFormatter()
                dateFormat.calendar = calendar
                dateFormat.dateFormat = fomtStr
                return dateFormat.string(from: date)
            }

            switch style {
            case .now:
                return "刚刚"
            case let .minutesAgain(miutes, _):
                return "\(miutes)分钟前"
            case let .hoursAgain(hours, _):
                return "\(hours)小时前"
            case let .yeasterday(date):
                return formatter(date, fomtStr: "昨天 HH:mm")
            case let .thisYear(date):
                return formatter(date, fomtStr: "MM-dd HH:mm")
            case let .beforYear(date):
                return formatter(date, fomtStr: "yyyy-MM-dd HH:mm")
            }
        }

        let seconds: Int64 = Int64(Date().timeIntervalSince(self))

        // 判断是否是一分钟以内
        if seconds < 60 {
            return callback(.now(self))
        }

        // 大于一分钟, 小于1小时
        if seconds < 3600 {
            return callback(.minutesAgain(Int(seconds) / 60, self))
        }

        // 大于一小时, 小于1天
        if seconds < 3600 * 24 {
            return callback(.hoursAgain(Int(seconds) / 3600, self))
        }

        // 判断是否是昨天: 昨天 05: 05
        if calendar.isDateInYesterday(self) {
            return callback(.yeasterday(self))
        } else {
            // 今年
            if zz_compare(date: Date(), formatter: "yyyy") == .orderedSame {
                return callback(.thisYear(self))
            } else { // 往年
                return callback(.beforYear(self))
            }
        }
    }

    private static let chineseMonthsArr = ["正", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "腊"]
    /// 农历月
    var zz_chineseMonth: String {
        let cheseMonthNum = zz_dateString("MM", calendar: Calendar.Identifier.chinese)
        return "\(Date.chineseMonthsArr[cheseMonthNum.zz_intValue - 1])月"
    }

    private static let chineseDaysArr = ["初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十",
                                         "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十",
                                         "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十"]
    /// 农历日
    var zz_chineseDay: String {
        let chineseDayNum = zz_dateString("dd", calendar: Calendar.Identifier.chinese)
        return "\(Date.chineseDaysArr[chineseDayNum.zz_intValue - 1])"
    }

    /// 时辰
    var zz_chineseHour: String {
        let startTime = "\(zz_year)-\(zz_month)-\(zz_day) 00:00:00"
        let startTimeDate = Date.zz_date(startTime, formatter: "yyyy-MM-dd HH:mm:ss")
        let startTimeStamp = (startTimeDate?.zz_timeStamp ?? 0) / 1000
        let nowTimeStamp = zz_timeStamp / 1000

        let timeSpace = (nowTimeStamp - startTimeStamp) / 60 / 60

        switch timeSpace {
        case 1 ... 3:
            return "丑时"
        case 3 ... 5:
            return "寅时"
        case 5 ... 7:
            return "卯时"
        case 7 ... 9:
            return "辰时"
        case 9 ... 11:
            return "巳时"
        case 11 ... 13:
            return "午时"
        case 13 ... 15:
            return "未时"
        case 15 ... 17:
            return "申时"
        case 17 ... 19:
            return "酉时"
        case 19 ... 21:
            return "戌时"
        case 21 ... 23:
            return "亥时"
        default: return "子时"
        }
    }
}
