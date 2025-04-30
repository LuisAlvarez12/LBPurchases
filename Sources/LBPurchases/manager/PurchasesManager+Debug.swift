//
//  PurchasesManager+Debug.swift
//  LBPurchases
//
//  Created by Luis Alvarez on 4/28/25.
//

import LBFoundation
import RevenueCat
import SwiftUI

/**
 Debug logic
 */
public extension PurchasesManager {
    
    public func enableDebug(hasSubscription: Bool, hasTrial: Bool) {
        __STATIC = true
        subscriptionState = SubscriptionState(subscriptionPeriod: hasSubscription ? .Active : .Inactive, customerInfo: nil, hasTrial: hasTrial)
        
        Features.logger.log("Purchases", message: "DEBUG Mode enabled")
    }
    
}
