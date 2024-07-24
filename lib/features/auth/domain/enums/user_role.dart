enum UserRole {
  student,
  teacher,
  admin,
  secretary,
}

extension ToUserRole on String {
  UserRole toUserRole() {
    switch (this) {
      case 'ADMIN':
        return UserRole.admin;
      case 'SECRETARY':
        return UserRole.secretary;
      default:
        return UserRole.student;
    }
  }
}
