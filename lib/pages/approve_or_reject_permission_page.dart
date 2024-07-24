import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/common/components/form_fields/text_form_field.dart';
import 'package:pms_admin/common/components/page_title.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';
import 'package:pms_admin/common/components/table/table.dart';
import 'package:pms_admin/common/components/table/table_cell.dart';
import 'package:pms_admin/common/components/table/table_label.dart';
import 'package:pms_admin/common/errors/error_widget.dart';
import 'package:pms_admin/features/permissions/data/providers/permission_absences_provider.dart';
import 'package:pms_admin/features/permissions/data/providers/permissions_provider.dart';
import 'package:pms_admin/features/permissions/domain/models/permission_absence_view.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/form_buttons/approve_permission_form_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/form_buttons/reject_permission_form_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/permission_absences_table.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/permission_status_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ApproveOrRejectPermissionPage extends ConsumerStatefulWidget {
  final int permissionId;
  const ApproveOrRejectPermissionPage({
    super.key,
    required this.permissionId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditPermissionPagState();
}

class _EditPermissionPagState
    extends ConsumerState<ApproveOrRejectPermissionPage> {
  late TextEditingController _principalCommentController;

  @override
  void initState() {
    _principalCommentController = TextEditingController();
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
        ref.watch(permissionDetailsProvider(widget.permissionId));

    return permission.when(
      data: (data) {
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
                    child: PermissionStatusWidget(
                      status: data.status,
                      verbose: true,
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
              const Row(
                children: [
                  Text(
                    "Acciones Rápidas",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RejectPermissionFormButton(
                    permissionId: widget.permissionId,
                    controller: _principalCommentController,
                  ),
                  ApprovePermissionFormButton(
                    permissionId: widget.permissionId,
                    controller: _principalCommentController,
                  ),
                ],
              ),
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
