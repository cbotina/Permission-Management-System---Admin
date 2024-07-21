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
import 'package:pms_admin/features/permissions/presentation/widgets/components/permission_absences_table.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/permission_status_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PermissionDetailsPage extends ConsumerWidget {
  final int permissionId;

  const PermissionDetailsPage({
    super.key,
    required this.permissionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permission = ref.watch(permissionDetailsProvider(permissionId));

    return permission.when(
      data: (data) {
        return Container(
          width: MediaQuery.of(context).size.width * .8,
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
                      child: const Text("Ver Evidencia"),
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
                      initialValue: data.principalNote,
                      readOnly: true,
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
              Align(
                alignment: Alignment.centerRight,
                child: PrimaryButton(
                  minWidth: 100,
                  child: const Text(
                    "Salir",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
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
