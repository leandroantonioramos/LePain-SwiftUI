import Foundation

final class UserPreferences {
    private let defaults = UserDefaults.standard

    private let completed = "completed"

    var isCompleted: Bool {
        set { defaults.setValue(newValue, forKey: completed) }
        get { defaults.bool(forKey: completed) }
    }

    class var shared: UserPreferences {
        struct Static {
            static let instance = UserPreferences()
        }

        return Static.instance
    }
}
