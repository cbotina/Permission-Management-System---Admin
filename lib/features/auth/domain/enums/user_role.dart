enum UserRole {
  student,
  teacher,
  admin,
  secretary,
}

extension ToUserRole on String {
  UserRole toUserRole() {
    switch (this) {
      case 'STUDENT':
        return UserRole.student;
      case 'TEACHER':
        return UserRole.teacher;
      default:
        return UserRole.student;
    }
  }
}
