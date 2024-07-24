import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:pms_admin/common/components/form_fields/text_form_field.dart';
import 'package:pms_admin/common/errors/error_widget.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/common/extensions/permission_status_to_string.dart';
import 'package:pms_admin/common/extensions/string_to_permission_status.dart';
import 'package:pms_admin/features/permissions/data/dto/update_permission_dto.dart';
import 'package:pms_admin/features/permissions/data/providers/permissions_provider.dart';
import 'package:pms_admin/features/permissions/domain/models/permission.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_with_student_view.dart';
import 'package:pms_admin/features/permissions/presentation/controllers/update_permission_controller.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/form_buttons/approve_permission_form_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/form_buttons/reject_permission_form_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/permission_absences_table.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/permission_status_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePermissionPage extends ConsumerStatefulWidget {
  final PermissionWithStudentView permission;
  const UpdatePermissionPage({
    super.key,
    required this.permission,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditPermissionPagState();
}

class _EditPermissionPagState extends ConsumerState<UpdatePermissionPage> {
  late TextEditingController _principalCommentController;
  late String? selectedStatus;

  @override
  void initState() {
    _principalCommentController = TextEditingController();
    selectedStatus = widget.permission.status.toLongString();
    super.initState();
  }

  @override
  void dispose() {
    _principalCommentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final permission =
        ref.watch(permissionDetailsProvider(widget.permission.permissionId));

    return permission.when(
      data: (data) {
        _principalCommentController.text = data.principalNote ?? "";
        return Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * .8,
            maxHeight: MediaQuery.of(context).size.height * .9,
          ),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Detalles de Permiso #${data.id}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Text(
                    "Datos Generales",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: OutlinedTextFormField(
                      label: 'Nombre Estudiante',
                      initialValue:
                          '${data.student.firstName} ${data.student.lastName}',
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: OutlinedTextFormField(
                      label: 'Motivo Permiso',
                      initialValue: data.reason,
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: SecondaryButton(
                      onTap: data.evidenceUrl != null
                          ? () async {
                              final Uri url = Uri.parse(data.evidenceUrl!);
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          : null,
                      child: data.evidenceUrl != null
                          ? const Text("Ver Evidencia")
                          : const Text("Sin evidencia"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: OutlinedTextFormField(
                      label: 'Fecha de solicitud',
                      initialValue: DateFormat.yMMMd().format(data.requestDate),
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: OutlinedTextFormField(
                      label: 'Fecha de aprobación',
                      initialValue: data.approvalDate != null
                          ? DateFormat.yMMMd().format(data.approvalDate!)
                          : "N/A",
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: EnumDropdownButtonFormField(
                      label: "Estado",
                      onSelected: (p0) {
                        setState(() {
                          selectedStatus = p0;
                        });
                      },
                      value: selectedStatus,
                      values: const [
                        'Aprobado',
                        'Rechazado',
                        'Pendiente',
                        'Salida'
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Text(
                    "Comentarios",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: OutlinedTextFormField(
                      label: 'Comentario Estudiante',
                      initialValue: data.studentNote,
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: OutlinedTextFormField(
                      label: 'Comentario Coordinadora',
                      controller: _principalCommentController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Text(
                    "Franjas horarias",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              PermissionAbsencesTable(permissionId: data.id),
              const SizedBox(height: 15),
              UpdatePermissionFormButton(
                selectedStatus: selectedStatus,
                principalCommentController: _principalCommentController,
                permissionId: widget.permission.permissionId,
              )

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     RejectPermissionFormButton(
              //       permissionId: widget.permissionId,
              //       controller: _principalCommentController,
              //     ),
              //     ApprovePermissionFormButton(
              //       permissionId: widget.permissionId,
              //       controller: _principalCommentController,
              //     ),
              //   ],
              // ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => ErrorWidgetUI(onRefresh: () {
        ref.invalidate(permissionDetailsProvider);
      }),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class UpdatePermissionFormButton extends ConsumerWidget {
  const UpdatePermissionFormButton({
    super.key,
    required this.selectedStatus,
    required TextEditingController principalCommentController,
    required this.permissionId,
  }) : _principalCommentController = principalCommentController;

  final String? selectedStatus;
  final TextEditingController _principalCommentController;
  final int permissionId;

  @override
  Widget build(BuildContext context, ref) {
    final AsyncValue<void> state =
        ref.watch(updatePermissionControllerProvider);

    ref.listen<AsyncValue<void>>(updatePermissionControllerProvider,
        (prev, state) {
      state.showSnackbarOnError(context);
      state.popOnSuccess(
        prev,
        "Permiso editado exitosamente",
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      child: const Text(
        "Aceptar",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: () {
        final dto = UpdatePermissionDto(
          status: selectedStatus!.toPermissionStatus(),
          approvalDate: selectedStatus == 'Aprobado' ? DateTime.now() : null,
          principalNote: _principalCommentController.text,
        );

        ref
            .read(updatePermissionControllerProvider.notifier)
            .updatePermission(permissionId, dto);
      },
    );
  }
}
