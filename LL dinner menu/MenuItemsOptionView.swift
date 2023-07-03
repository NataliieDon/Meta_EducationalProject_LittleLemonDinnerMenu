//
//  MenuItemsOptionView.swift
//  LL dinner menu
//
//  Created by Nataliia Dontsova on 01.07.2023.
//

import SwiftUI

enum SelectedCategory: String, CaseIterable {
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
}
enum SortMenuItems: String, CaseIterable {
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabetically = "A-Z"
}
    
struct MenuItemsOptionView: View {
    let selectedCategories: [SelectedCategory] = SelectedCategory.allCases
    let sortOptions: [SortMenuItems] = SortMenuItems.allCases
    @Environment (\.presentationMode)
    var presentationMode
    
    
    var body: some View {
        VStack {
            Text("Filter")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
            List {
                Section(header: Text("SELECTED CATEGORIES")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    .background(Color.clear)
                ) {
                    ForEach(selectedCategories, id: \.self) {
                        category in
                        Text(category.rawValue)
                            .font(.body)
                    }
                }
                Section(header: Text ("SORT BY")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    .background(Color.clear)
                ) {
                    ForEach(sortOptions, id: \.self) {
                        option in
                        Text(option.rawValue)
                            .font(.body)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        
   }
    
     var backButton: some View {
             Button(action: {
                 presentationMode.wrappedValue.dismiss()
             }) {
                 HStack {
                     Image(systemName: "chevron.left")
                     Text("Menu")
                 }
             }
         }
    }
    
    






struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView()
    }
}

