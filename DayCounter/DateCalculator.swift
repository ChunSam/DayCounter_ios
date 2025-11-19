import Foundation

struct DateCalculator {
    
    /// Calculates the number of days between two dates.
    /// - Parameters:
    ///   - start: The starting date.
    ///   - end: The ending date.
    /// - Returns: The number of days between the two dates.
    static func daysBetween(start: Date, end: Date) -> Int {
        let calendar = Calendar.current
        let startOfDay1 = calendar.startOfDay(for: start)
        let startOfDay2 = calendar.startOfDay(for: end)
        
        let components = calendar.dateComponents([.day], from: startOfDay1, to: startOfDay2)
        return components.day ?? 0
    }
    
    /// Calculates a future or past date by adding days to a start date.
    /// - Parameters:
    ///   - start: The starting date.
    ///   - days: The number of days to add (can be negative).
    /// - Returns: The resulting date.
    static func dateAfter(days: Int, from start: Date) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: days, to: start) ?? start
    }
}
