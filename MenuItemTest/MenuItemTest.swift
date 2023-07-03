//
//  MenuItemTest.swift
//  MenuItemTest
//
//  Created by Nataliia Dontsova on 02.07.2023.
//

import XCTest
@testable import LL_dinner_menu


final class MenuItemTest: XCTestCase {
        func testMenuItemTitle() {
            let menuItem = MenuItem(title: "Example Title")
            XCTAssertEqual(menuItem.title, "Example Title")
        }

        func testMenuItemIngredients() {
            let ingredients: [Ingredient] = [.broccoli, .carrot, .pasta, .sauceTomato, .spinach]
            
            let menuItem = MenuItem(ingredients: ingredients)
            XCTAssertEqual(menuItem.ingredients, ingredients)
        }

    }
    

