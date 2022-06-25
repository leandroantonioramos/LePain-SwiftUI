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
                            .font(.system(size: 24))
                            .multilineTextAlignment(.center)
                        Text(pageViewString(text: subtitle))
                            .multilineTextAlignment(.center)
                            .font(.system(size: 16))
                    }
                    VStack (alignment: .center) {
                        NavigationLink(destination: PerfilView()) {
                            Text(pageViewString(text: buttonTitle))
                        }.simultaneousGesture(TapGesture().onEnded{
                            onboardingCompleteStatus.toggle()
                            updateOnboardingInfo()
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
            UserDefaults.standard.set(onboardingCompleteStatus, forKey: "completed")
        } else {
            UserDefaults.standard.set(onboardingCompleteStatus, forKey: "incomplete")
        }
    }
}
