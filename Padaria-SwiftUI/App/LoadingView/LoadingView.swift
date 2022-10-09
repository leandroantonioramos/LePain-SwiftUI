import SwiftUI

struct LoadingView: View {
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            
            Color("background").edgesIgnoringSafeArea(.all)
            
            Text("Loading")
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
