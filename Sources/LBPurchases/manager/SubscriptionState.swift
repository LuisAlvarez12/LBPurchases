//
//  SubscriptionState.swift
//  LBPurchases
//
//  Created by Luis Alvarez on 4/28/25.
//
import RevenueCat

public struct SubscriptionState {
    public let subscriptionPeriod: SubscriptionPeriod
    public var customerInfo: CustomerInfo? = nil
    public var hasTrial: Bool = false
}
