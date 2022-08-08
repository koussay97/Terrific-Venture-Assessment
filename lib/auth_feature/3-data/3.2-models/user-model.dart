import 'package:terrific_venture_assessment/auth_feature/2-domain/2.1-entities/user.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-1-entities/company.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-2-models/comapny-model.dart';

class UserModel extends User {
  const UserModel({
    required String role,
    required String id,
    required bool isArchived,
    required String profilePicture,
    required bool isApproved,
    required UserCompany company,
    required String name,
    required String phoneNumber,
  }) : super(
      role: role,
      id: id,
      isArchived: isArchived,
      profilePicture: profilePicture,
      isApproved: isApproved,
      company: company,
      name: name,
      phoneNumber: phoneNumber);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        role: json['roles'],
        id: json['id'],
        isArchived: json['isArchived'],
        profilePicture: json['profilePicture'],
        isApproved: json['isApproved'],
        company: CompanyModel.fromJson(json['company']),
        // company from json
        name: json['name'],
        phoneNumber: json['phoneNumber']
    );
  }

  static toJson(UserModel model) {

    /* converting company entity to a model::
    * why ?? because a CompanyModel is a UserCompany entity because ::
    * CompanyModel extends CompanyEntity
    * however the opposite is not correct! so we need to do it manually
    * */
    var cmpModel = CompanyModel(id: model.company.id,
        isArchived: model.company.isArchived,
        internalComment: model.company.internalComment,
        name: model.company.name,
        logo: model.company.logo,
        vatNumber: model.company.vatNumber,
        commercialLicence: model.company.commercialLicence,
        contactEmail: model.company.contactEmail,
        phoneNumber: model.company.phoneNumber,
        telephone: model.company.telephone,
        location: model.company.location,
        companyAdminName: model.company.companyAdminName);

    // now we can construct our json map
    // note that we might not need this because we do not have
    // a user crud feature yet

    return {
      'role': model.role,
      'profilePicture': model.profilePicture,
      'id': model.id,
      'company': CompanyModel.toJson(cmpModel), // company to json
      'name': model.name,
      'phoneNumber': model.phoneNumber
    };
  }
}
