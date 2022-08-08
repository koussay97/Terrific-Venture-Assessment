


import 'package:equatable/equatable.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-1-entities/company.dart';

class User extends Equatable {
  final String id;
  final bool isArchived;
  final String profilePicture;
  final String name;
  final String phoneNumber;
  final bool isApproved;
  final String role;
  final UserCompany company;


  const User({
    required this.role,
    required this.id,
    required this.isArchived,
    required this.profilePicture,
    required this.isApproved,
    required this.company,
    required this.name,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    phoneNumber,

  ];
}






/* json response
*  "status": 200,
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI4YmVhMGIzOS1mOTQxLTQ0ZjgtOWM0OC04ZTFlYWZjY2FkOGEiLCJpYXQiOjE2NTk4NDc4MTQsImV4cCI6MTY1OTg1MTQxNH0.3Nz9ZrTcXkkNpJek6xDh8BUHLkYe51zqXlx1wedg6ME",
    "refreshToken": "sztyC2aKTAR9RlPH",
    "user": {
        "id": "8bea0b39-f941-44f8-9c48-8e1eafccad8a",
        "isArchived": false,
        "createDateTime": "2022-05-30T10:24:48.797Z",
        "lastChangedDateTime": "2022-08-03T11:33:11.519Z",
        "deletedAt": null,
        "internalComment": null,
        "name": "Yassine B",
        "phoneNumber": "+21693252427",
        "profilePictue": null,
        "isApproved": true,
        "refreshToken": "kus26Otz2mnz7Mjz",
        "refreshtokenexpires": "2022-08-10T11:33:11.518+00:00",
        "roles": "companyadmin",
        "branch": null
    },
    "company": {
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
    }
}
*
* */