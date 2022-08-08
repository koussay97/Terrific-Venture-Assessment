import 'package:equatable/equatable.dart';


class UserCompany extends Equatable {
  final String id;
  final bool isArchived;
  final String internalComment;
  final String name;
  final String logo;
  final String vatNumber;
  final String commercialLicence;
  final String contactEmail;
  final String phoneNumber;
  final String telephone;
  final String location;
  final List<String> companyAdminName;

  const UserCompany({
    required this.id,
    required this.isArchived,
    required this.internalComment,
    required this.name,
    required this.logo,
    required this.vatNumber,
    required this.commercialLicence,
    required this.contactEmail,
    required this.phoneNumber,
    required this.telephone,
    required this.location,
    required this.companyAdminName,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    contactEmail,
  ];
}

/// company get response
/*
* "data": {
        "id": "472e17df-dafc-438e-af2f-9dc1ff47733f",
        "isArchived": false,
        "createDateTime": "2022-05-30T10:25:48.876Z",
        "lastChangedDateTime": "2022-08-03T11:34:08.749Z",
        "deletedAt": null,
        "internalComment": null,
        "name": "moulin yellow",
        "logo": "https://gearni.sfo3.digitaloceanspaces.com/1659523934898-aaaaaaa.jpg",
        "vatNumber": "https://gearni.sfo3.digitaloceanspaces.com/1659523934898-aaaaaaa.jpg",
        "commercialLicence": "https://gearni.sfo3.digitaloceanspaces.com/1659523934898-aaaaaaa.jpg",
        "contactEmail": "theehorizon@gmail.com",
        "phoneNumber": "93252427",
        "telephone": "71252624",
        "location": "  Al-Quwaiyah 19211 19211"
    },
    "CompanyAdminName": [
        "Yassine B"
    ]
* */
