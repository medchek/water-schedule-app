import 'package:flutter_test/flutter_test.dart';
import 'package:seaal_water_schedule_app/store/modules/wilayas.dart';

void main() {
  test("fetchWilyas shoudld get data from the api and store it in the state",
      () async {
    final wilayaStore = Wilayas();
    await wilayaStore.fetchWilayas();
    expect(wilayaStore.wilayaList.length, greaterThan(47));
  });
  test(
      "getWilaya should return the Wilaya object when data is correctly present",
      () async {
    final wilayaStore = Wilayas();
    await wilayaStore.fetchWilayas();

    expect(wilayaStore.wilayaList.isNotEmpty, isTrue);

    final wilaya = wilayaStore.getWilaya(16); // Alger
    expect(wilaya, isNotNull);
  });
}
