class OutOfStockException implements Exception {
  final String item;
  OutOfStockException(this.item);
  @override
  String toString() => '$item is out of stock';
}

class PaymentDeclinedException implements Exception {
  final String reason;
  PaymentDeclinedException(this.reason);
  @override
  String toString() => 'Payment declined: $reason';
}

void processCheckout(String item, bool inStock, bool paymentOk) {
  if (!inStock) {
    throw OutOfStockException(item);
  }
  if (!paymentOk) {
    throw PaymentDeclinedException('Card expired');
  }
  print('Checkout successful for $item');
}

void handleCheckout(String item, bool inStock, bool paymentOk) {
  try {
    processCheckout(item, inStock, paymentOk);
  } on OutOfStockException catch (e) {
    // Most specific: checked first
    print('Inventory issue: $e');
    print('Suggesting similar items...');
  } on PaymentDeclinedException catch (e) {
    // Also specific: checked second
    print('Payment issue: $e');
    print('Please update your payment method');
  } on Exception catch (e) {
    // General Exception: checked before the most general catch
    print('General exception: $e');
  } catch (e) {
    // Catches literally anything else, including Errors
    print('Unexpected failure: $e');
  }
}

void main() {
  print('Out of stock');
  handleCheckout('Laptop', false, true);

  print('\nPayment declined');
  handleCheckout('Phone', true, false);

  print('\nSuccessful checkout');
  handleCheckout('Mouse', true, true);
}
