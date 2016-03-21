//
//  OOOCalc.swift
//  NSDecimalNumber
//
//  Created by air on 2016/03/19.
//  Copyright © 2016年 oomori. All rights reserved.
//

import Foundation

class OOOCalc: NSObject , NSDecimalNumberBehaviors {
    func exceptionDuringOperation(operation: Selector,
            error: NSCalculationError,
        leftOperand: NSDecimalNumber,
        rightOperand: NSDecimalNumber?
        ) -> NSDecimalNumber? {
        
        let deNum : NSDecimalNumber
        let num : NSNumber = NSNumber(float: 233.333)
        deNum = NSDecimalNumber(decimal: num.decimalValue)
        return deNum;
    }
    func roundingMode() -> NSRoundingMode {
        return NSRoundingMode.RoundPlain
    }
    func scale() -> Int16 {
        return 2
    }

}
