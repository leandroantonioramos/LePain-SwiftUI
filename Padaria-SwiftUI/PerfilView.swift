import SwiftUI

struct PerfilView: View {

    var body: some View {
        NavigationView {
                VStack {
                    Text("outra view")
                }
                .background(Color("background"))
//            }
        }
        .navigationBarTitle("Update")
        .navigationBarHidden(false)
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}
