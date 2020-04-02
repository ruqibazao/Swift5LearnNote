//
//  CalculatorButtonItem.swift
//  SwiftUILearn
//
//  Created by nenhall on 2020/1/17.
//  Copyright © 2020 nenhall. All rights reserved.
//

import Foundation

enum CalculatorButtonItem {
enum Op: String {
case plus = "+"
case minus = "-"
case divide = "÷"
case multiply = "×"
case equal = "="
}
    
enum Command: String {
case clear = "AC"
case flip = "+/-"
case percent = "%"
}
    
case digit(Int)
case dot
case op(Op)
case command(Command)
}
