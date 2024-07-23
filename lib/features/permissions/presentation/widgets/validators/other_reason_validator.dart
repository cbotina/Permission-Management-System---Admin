String? Function(String?) otherReasonValidator = (String? value) {
  if (value == null || value == '') {
    return 'Debe especificar el motivo de su permiso';
  }
  return null;
};
