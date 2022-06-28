import Foundation

final class UserPreferences {
    private let defaults = UserDefaults.standard

    private let completed = "completed"
    private let userName = "username"

    var isCompleted: Bool {
        set { defaults.setValue(newValue, forKey: completed) }
        get { defaults.bool(forKey: completed) }
    }

    var hasUserName: String {
        set { defaults.setValue(newValue, forKey: userName) }
        get { defaults.string(forKey: userName) ?? "" }
    }

    class var shared: UserPreferences {
        struct Static {
            static let instance = UserPreferences()
        }

        return Static.instance
    }
}
