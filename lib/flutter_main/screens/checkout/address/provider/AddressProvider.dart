import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/city.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class AddressModel {
  submitNewAddress(
      {id,
      title,
      streetName,
      cityId,
      buildingNumber,
      floor,
      apartmentNumber,
      onSuccess,
      onError}) {
    DIOManager().submitNewAddress(
      addressId: id,
      title: title,
      streetName: streetName,
      apartmentNumber: apartmentNumber,
      buildingNumber: buildingNumber,
      floorNumber: floor,
      regionId: cityId,
      onSuccess: (response) {
        onSuccess(response);
      },
      onError: (errorResponse) {
        onError(errorResponse);
      },
    );
  }

  editAddress(
      {id,
      title,
      streetName,
      cityId,
      buildingNumber,
      floor,
      apartmentNumber,
      onSuccess,
      onError}) {
    DIOManager().editAddress(
      addressId: id,
      title: title,
      streetName: streetName,
      apartmentNumber: apartmentNumber,
      buildingNumber: buildingNumber,
      floorNumber: floor,
      regionId: cityId,
      onSuccess: (response) {
        onSuccess(response);
      },
      onError: (errorResponse) {
        // print("AddressModel ---->"+errorResponse.toString());
        onError(errorResponse);
      },
    );
  }

  getSavedAddress({onSuccess, onError, page}) {
    DIOManager().getSavedAddress(
      onSuccess: (response) {
        List<Address> aAddressList =
            (response as List).map((model) => Address.fromJson(model)).toList();
        onSuccess(aAddressList);
      },
      onError: (errorResponse) {
        onError(errorResponse);
      },
    );
  }

  getCities({onSuccess, onError}) {
    DIOManager().getCities(
      onSuccess: (response) {
        List<City> aAddressList =
            (response as List).map((model) => City.fromJson(model)).toList();
        onSuccess(aAddressList);
      },
      onError: (errorResponse) {
        onError(errorResponse);
      },
    );
  }

  getCitiesRegion({onSuccess, onError, cityId}) {
    DIOManager().getCitiesRegion(
      cityId: cityId,
      onSuccess: (response) {
        List<City> aAddressList =
            (response as List).map((model) => City.fromJson(model)).toList();
        onSuccess(aAddressList);
      },
      onError: (errorResponse) {
        onError(errorResponse);
      },
    );
  }
}
