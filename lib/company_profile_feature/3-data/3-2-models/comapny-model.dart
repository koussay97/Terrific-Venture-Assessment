import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-1-entities/company.dart';

class CompanyModel extends UserCompany {
  const CompanyModel({
    required String id,
    required bool isArchived,
    required String internalComment,
    required String name,
    required String logo,
    required String vatNumber,
    required String commercialLicence,
    required String contactEmail,
    required String phoneNumber,
    required String telephone,
    required String location,
    required List<String> companyAdminName
  }) : super(
    vatNumber: vatNumber,
    telephone: telephone,
    logo: logo,
    location: location,
    contactEmail: contactEmail,
    companyAdminName: companyAdminName,
    commercialLicence: commercialLicence,
    id: id,
    isArchived: isArchived,
    name: name,
    phoneNumber: phoneNumber,
    internalComment: internalComment
  );

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        vatNumber: json['vatNumber'],
        telephone: json['telephone'],
        logo: json['logo'],
        location: json['location'],
        contactEmail: json['contactEmail'],
        companyAdminName: json['companyAdminName'],
        commercialLicence: json['commercialLicence'],
        id: json['id'],
        isArchived: json['isArchived'],
        name: json['name'],
        phoneNumber: json['phoneNumber'],
        internalComment: json['internalComment']
    );
  }

  static toJson(CompanyModel model) {
    return {
      'vatNumber': model.vatNumber,
      'telephone': model.telephone,
      'logo': model.logo,
      'location': model.location,
      'contactEmail': model.contactEmail,
      'companyAdminName': model.companyAdminName,
      'commercialLicence': model.commercialLicence,
      'id': model.id,
      'name': model.name,
      'phoneNumber': model.phoneNumber,
      'internalComment': model.internalComment
    };
  }
}
