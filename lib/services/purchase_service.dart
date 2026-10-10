// lib/services/purchase_service.dart
//
// Wraps the RevenueCat SDK so screens never call Purchases.* directly.
// Entitlement / offering ids must match your RevenueCat dashboard.

import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class PurchaseService {
  static const String entitlementId = 'zenframe_pro';

  /// True if the user currently has the Pro entitlement.
  /// Returns false on any error so the app falls back to the free tier.
  static Future<bool> checkEntitlement() async {
    try {
      final CustomerInfo info = await Purchases.getCustomerInfo();
      return info.entitlements.active.containsKey(entitlementId);
    } catch (e) {
      debugPrint('checkEntitlement failed: $e');
      return false;
    }
  }

  /// Shows the RevenueCat paywall. Returns true if the user ends up with Pro.
  static Future<bool> showPaywall() async {
    try {
      await RevenueCatUI.presentPaywallIfNeeded(entitlementId);
      return await checkEntitlement();
    } catch (e) {
      debugPrint('showPaywall failed: $e');
      return false;
    }
  }

  /// Lets users on a new phone get their purchase back.
  static Future<bool> restore() async {
    try {
      final CustomerInfo info = await Purchases.restorePurchases();
      return info.entitlements.active.containsKey(entitlementId);
    } catch (e) {
      debugPrint('restore failed: $e');
      return false;
    }
  }
}
