import SwiftUI

struct PerfilView: View {
    
    var body: some View {
        ZStack (alignment: .top) {
            Color("background").edgesIgnoringSafeArea(.all)
            VStack {
                Text("chega")
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Perfil")
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}
