//
//  HomeView.swift
//  To-Do-App
//
//  Created by Javid Gafarli on 11.03.26.
//

import SwiftUI

struct FormPageView: View {
    @ObservedObject var vm: AddFormPageViewModel
    
    var body: some View {
        List{
            ForEach(vm.items){ list in
                Text(list.text)
            }
        }
    }
}


#Preview {
//    FormPageView()
}
