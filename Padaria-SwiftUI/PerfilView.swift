import SwiftUI

struct PerfilView: View {
    @State private var hasCompleteOnboarding: Bool? = nil

    var body: some View {
        NavigationView {
            ZStack (alignment: .top) {
                Color("background").edgesIgnoringSafeArea(.all)
                VStack {
                    Text("outra view")
                }
                .background(Color("background"))
            }
        }
        .navigationTitle("Perfil")
        .navigationBarBackButtonHidden(true)
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}
