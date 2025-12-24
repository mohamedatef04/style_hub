import 'package:style_hub/features/cart/domain/entities/address_entity.dart';

class AddressModel {
  final String? id;
  final String state;
  final String city;
  final String street;
  final String apartment;
  final String phoneNumber;
  final String? notes;

  AddressModel({
    this.id,
    required this.state,
    required this.city,
    required this.street,
    required this.apartment,
    required this.phoneNumber,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'state': state,
      'city': city,
      'street': street,
      'apartment': apartment,
      'phoneNumber': phoneNumber,
      'notes': notes,
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'],
      state: map['state'],
      city: map['city'],
      street: map['street'],
      apartment: map['apartment'],
      phoneNumber: map['phoneNumber'],
      notes: map['notes'],
    );
  }
  factory AddressModel.fromEntity(AddressEntity addressEntity) {
    return AddressModel(
      id: addressEntity.id,
      state: addressEntity.state,
      city: addressEntity.city,
      street: addressEntity.street,
      apartment: addressEntity.apartment,
      phoneNumber: addressEntity.phoneNumber,
      notes: addressEntity.notes,
    );
  }

  AddressEntity toEntity() => AddressEntity(
    id: id,
    state: state,
    city: city,
    street: street,
    apartment: apartment,
    phoneNumber: phoneNumber,
    notes: notes,
  );
}
