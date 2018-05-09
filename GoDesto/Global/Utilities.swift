import Foundation
import UIKit
private var maxLengths = [UITextField: Int]()

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }}

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
    
    func boldString(fontSize : CGFloat ,font : UIFont?) -> NSMutableAttributedString {
        let attrs = [NSAttributedStringKey.font : font ?? UIFont.systemFont(ofSize: 8)]
        return NSMutableAttributedString(string:self, attributes:attrs)
    }
}

extension UITextField {
    
    // 3
    @IBInspectable var maxLength: Int {
        get {
            // 4
            guard let length = maxLengths[self] else {
                return Int.max
            }
            return length
        }
        set {
            maxLengths[self] = newValue
            // 5
            addTarget(
                self,
                action: #selector(limitLength),
                for: UIControlEvents.editingChanged
            )
        }
    }
    
    @objc func limitLength(textField: UITextField) {
        // 6
        guard let prospectiveText = textField.text,
            prospectiveText.characters.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        // 7
        let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        text = prospectiveText.substring(to: maxCharIndex)
        selectedTextRange = selection
    }
    
}
extension NSAttributedString {
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.width)
    }
}


class Utilities {
    static func unArchiveObject(key: String) -> AnyObject? {
        guard let data = UserDefaults.standard.object(forKey: LOGIN_KEY) as? Data else {
            return nil
        }
        return NSKeyedUnarchiver.unarchiveObject(with: data) as AnyObject
    }

   static func txtfeildSpacing(textfield:UITextField){
        textfield.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
    }
    static func txtfieldPlaceholderWhite(textfield:UITextField){
        textfield .setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
    }

    static func isValidEmail(_ testStr:String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    static func checkIfStringContiansSpacesOrArabic(string: String) -> Bool{
        
        let urlRegEx = "(?s).*\\p{Arabic}.*"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        return (urlTest.evaluate(with: string) || string.containsWhiteSpace())
    }
    
    static   func textAttachmentWithImage(flag:intmax_t,title: NSString,image: NSString,fontName:UIFont) -> NSMutableAttributedString {
        
        let textAttachment = NSTextAttachment()
        
        
        textAttachment.image = UIImage(named: image as String)
        
        let mid = fontName.descender + fontName.capHeight
        
        if (flag == 0)
        {
            textAttachment.bounds = CGRect(x: 0, y: fontName.descender - textAttachment.image!.size.height / 2 + mid + 2, width: textAttachment.image!.size.width, height: textAttachment.image!.size.height).integral
        }
        else
        {
            textAttachment.bounds = CGRect(x: 0, y: fontName.descender - textAttachment.image!.size.height / 2 + mid + 2 , width: textAttachment.image!.size.width, height: textAttachment.image!.size.height).integral
        }
        
        let attachmentString = NSAttributedString(attachment: textAttachment)
        let newString = NSMutableAttributedString()
        let myString = NSMutableAttributedString(string:title as String)
        
        if (flag == 2)
        {
            newString.append(myString)
            newString.append(attachmentString)
            
        }
        else
        {
            newString.append(attachmentString)
            newString.append(myString)
        }
        
        return newString
    }
   
    static func getMultipleTextColor(text1:String,text2:String) -> NSAttributedString{
        
        let attrs1 = [NSAttributedStringKey.font : UIFont(name: FontName.MyriadProRegular, size: 14), NSAttributedStringKey.foregroundColor : UIColor.black]
        
        let attrs2 = [NSAttributedStringKey.font : UIFont(name: FontName.MyriadProRegular, size: 10), NSAttributedStringKey.foregroundColor : UIColor.lightGray]
        
        let attributedString1 = NSMutableAttributedString(string:text1, attributes:attrs1)
        
        let attributedString2 = NSMutableAttributedString(string:text2, attributes:attrs2)
        
        attributedString1.append(attributedString2)
       
        return attributedString1
    }
   
   
    static func getUTCDateFromTimeSpanString(dateStr : String) -> Date{
        var date = Date()
        let formate = DateFormatter()
        formate.locale = Locale(identifier: "en_US_POSIX")
        formate.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formate.timeZone = TimeZone(identifier: "UTC")
        
        date = formate.date(from: dateStr)!
        
        return date
    }
    
    static func isDateGreater(serverDate: Date, appDate: Date)-> Bool {
        
        let compare = appDate.compare(serverDate)
        
        if compare == .orderedAscending {
            return true
        }else{
            return false
        }
    }
   static func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "dd MMM YYYY"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
    static func getStringFromDate(date:Date, dateFormat: String = "dd MMM YYYY") -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let dateString = formatter.string(from: date)
        
        return dateString
    }
    static func getStringWithFormateFromDate(date:Date) -> String{
        let formatter = DateFormatter()
        
        formatter.dateFormat = "YYYY-MM-dd"
        let dateString = formatter.string(from: date)
        
        return dateString
    }
    static func  getDateString(string:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone!
        let data = dateFormatter.date(from: string)!
        
        return self.getStringFromDate(date: data)
    }
    
    static func getTimeStringFromDate(date:Date) -> String{
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "h:mm a"
        let timeStemp = formatter.string(from: date)
        
        return timeStemp
        
    }
    static func getCurrentDateString() -> String{
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd MMM YYYY"
        let timeStemp = formatter.string(from: date)
        
        return timeStemp
        
    }
    static func getNextDateString(date:Date,value:Int? = 1) -> String{
        let today = date
        let tomorrow = Calendar.current.date(byAdding: .day, value: value!, to: today)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd MMM YYYY"
        let timeStemp = formatter.string(from: tomorrow!)
        
        return timeStemp
    }
    static func getNextDateStringForDay(date:Date,value:Int? = 1) -> String{
        let today = date
        let tomorrow = Calendar.current.date(byAdding: .day, value: value!, to: today)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dddd"
        let timeStemp = formatter.string(from: tomorrow!)
        
        return timeStemp
    }
}

extension Date {
    
    /// Returns a Date with the specified days added to the one it is called with
    func add(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        var targetDay: Date
        targetDay = Calendar.current.date(byAdding: .year, value: years, to: self)!
        targetDay = Calendar.current.date(byAdding: .month, value: months, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .day, value: days, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .hour, value: hours, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .minute, value: minutes, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .second, value: seconds, to: targetDay)!
        return targetDay
    }
    
    /// Returns a Date with the specified days subtracted from the one it is called with
    func subtract(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        let inverseYears = -1 * years
        let inverseMonths = -1 * months
        let inverseDays = -1 * days
        let inverseHours = -1 * hours
        let inverseMinutes = -1 * minutes
        let inverseSeconds = -1 * seconds
        return add(years: inverseYears, months: inverseMonths, days: inverseDays, hours: inverseHours, minutes: inverseMinutes, seconds: inverseSeconds)
    }
    
}

