// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalDiploma {
    address public admin;

    enum DiplomaStatus { NotIssued, Issued, Verified }

    struct Diploma {
        string name;
        string course;
        string email;
        DiplomaStatus status;
    }

    mapping(address => Diploma) public diplomas;

    event DiplomaIssued(address indexed student, string name, string course, string email, DiplomaStatus status);
    event DiplomaVerified(address indexed student, string name, string course, string email, DiplomaStatus status);


    constructor() {
        admin = msg.sender;
    }

    function issueDiploma(address _student, string memory _name, string memory _course, string memory _email) external {
        require(diplomas[_student].status == DiplomaStatus.NotIssued, "Diploma already issued");

        diplomas[_student] = Diploma({
            name: _name,
            course: _course,
            email: _email,
            status: DiplomaStatus.Issued
        });

        emit DiplomaIssued(_student, _name, _course, _email, diplomas[_student].status);
    }

    function verifyDiploma(address _student) external {
        require(diplomas[_student].status == DiplomaStatus.Issued, "Diploma not issued");

        diplomas[_student].status = DiplomaStatus.Verified;

        emit DiplomaVerified(_student, diplomas[_student].name, diplomas[_student].course, diplomas[_student].email, diplomas[_student].status);
    }
}
// SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// contract DigitalDiploma {
//     address public admin;

//     enum DiplomaStatus { NotIssued, Issued, Verified }

//     struct Diploma {
//         DiplomaStatus status;
//     }

//     mapping(address => Diploma) public diplomas;

//     event DiplomaIssued(address indexed student, DiplomaStatus status);
//     event DiplomaVerified(address indexed student, DiplomaStatus status);

//     modifier onlyAdmin() {
//         require(msg.sender == admin, "Caller is not the admin");
//         _;
//     }

//     constructor() {
//         admin = msg.sender;
//     }

//     function issueDiploma(address _student) external onlyAdmin {
//         require(diplomas[_student].status == DiplomaStatus.NotIssued, "Diploma already issued");

//         diplomas[_student].status = DiplomaStatus.Issued;

//         emit DiplomaIssued(_student, diplomas[_student].status);
//     }

//     function verifyDiploma(address _student) external onlyAdmin {
//         require(diplomas[_student].status == DiplomaStatus.Issued, "Diploma not issued");

//         diplomas[_student].status = DiplomaStatus.Verified;

//         emit DiplomaVerified(_student, diplomas[_student].status);
//     }
// }





///// before code update 
// SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// contract DigitalDiploma {
//     address public admin;

//     enum DiplomaStatus { NotIssued, Issued, Verified }

//     struct Diploma {
//         string name;
//         string course;
//         string email;
//         DiplomaStatus status;
//     }

//     mapping(address => Diploma) public diplomas;

//     event DiplomaIssued(address indexed student, string name, string course, string email, DiplomaStatus status);
//     event DiplomaVerified(address indexed student, string name, string course, string email, DiplomaStatus status);

//     modifier onlyAdmin() {
//         require(msg.sender == admin, "Caller is not the admin");
//         _;
//     }

//     constructor() {
//         admin = msg.sender;
//     }

//     function issueDiploma(address _student, string memory _name, string memory _course, string memory _email) external onlyAdmin {
//         require(diplomas[_student].status == DiplomaStatus.NotIssued, "Diploma already issued");

//         diplomas[_student] = Diploma({
//             name: _name,
//             course: _course,
//             email: _email,
//             status: DiplomaStatus.Issued
//         });

//         emit DiplomaIssued(_student, _name, _course, _email, diplomas[_student].status);
//     }

//     function verifyDiploma(address _student) external onlyAdmin {
//         require(diplomas[_student].status == DiplomaStatus.Issued, "Diploma not issued");

//         diplomas[_student].status = DiplomaStatus.Verified;

//         emit DiplomaVerified(_student, diplomas[_student].name, diplomas[_student].course, diplomas[_student].email, diplomas[_student].status);
//     }
// }




// and again, garaas avdag bolgohged
// SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// contract DigitalDiploma {
//     address public admin;

//     enum DiplomaStatus { NotIssued, Issued, Verified }

//     struct Diploma {
//         string name;
//         string course;
//         string email;
//         DiplomaStatus status;
//     }

//     mapping(address => Diploma) public diplomas;

//     event DiplomaIssued(address indexed student, string name, string course, string email, DiplomaStatus status);
//     event DiplomaVerified(address indexed student, string name, string course, string email, DiplomaStatus status);


//     constructor() {
//         admin = msg.sender;
//     }

//     function issueDiploma(address _student, string memory _name, string memory _course, string memory _email) external {
//         require(diplomas[_student].status == DiplomaStatus.NotIssued, "Diploma already issued");

//         diplomas[_student] = Diploma({
//             name: _name,
//             course: _course,
//             email: _email,
//             status: DiplomaStatus.Issued
//         });

//         emit DiplomaIssued(_student, _name, _course, _email, diplomas[_student].status);
//     }

//     function verifyDiploma(address _student) external {
//         require(diplomas[_student].status == DiplomaStatus.Issued, "Diploma not issued");

//         diplomas[_student].status = DiplomaStatus.Verified;

//         emit DiplomaVerified(_student, diplomas[_student].name, diplomas[_student].course, diplomas[_student].email, diplomas[_student].status);
//     }
// }

