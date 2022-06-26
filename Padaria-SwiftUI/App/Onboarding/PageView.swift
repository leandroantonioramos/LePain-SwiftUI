import SwiftUI

struct PageView: View, Identifiable {
    @State private var onboardingCompleteStatus = false

    var id = UUID()
    var imageName: String? = nil
    var title: String? = nil
    var subtitle: String? = nil
    var buttonTitle: String? = nil
    var hasButton: Bool? = nil
    
    init(imageName: String? = nil,
         title: String? = nil,
         subtitle: String? = nil,
         buttonTitle: String? = nil,
         hasButton: Bool? = nil)
    {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.hasButton = hasButton
    }
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: pageViewString(text: imageName))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(height: 200)
                VStack (alignment: .center,
                        spacing: 60) {
                    VStack (spacing: 10) {
                        Text(pageViewString(text: title))
                            .fontWeight(.bold)
                            .font(.title)
                            .multilineTextAlignment(.center)
                        Text(pageViewString(text: subtitle))
                            .multilineTextAlignment(.center)
                            .font(.body)
                    }
                    VStack (alignment: .center) {
                        NavigationLink(destination: PerfilView(viewModel: PerfilViewModel())) {
                            Text(pageViewString(text: buttonTitle))
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            onboardingCompleteStatus.toggle()
                            updateOnboardingInfo()
//                            resetDefaults()
                        })
                        .frame(minWidth: 0,
                               maxWidth: .infinity)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white,
                                        lineWidth: 2))
                        .isHidden(showButton(hasButton: hasButton))
                    }
                }
            }
            .padding(15)
        }
    }
    
    func pageViewString(text: String?) -> String
    {
        guard let text = text else {
            return ""
        }
        return text
    }
    
    func showButton(hasButton: Bool?) -> Bool
    {
        guard let hasButton = hasButton else {
            return true
        }
        
        return hasButton
    }

    func updateOnboardingInfo()
    {
        if onboardingCompleteStatus {
            UserPreferences.shared.isCompleted = onboardingCompleteStatus
        } else {
            UserPreferences.shared.isCompleted = onboardingCompleteStatus
        }
    }

    func resetDefaults()
    {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
