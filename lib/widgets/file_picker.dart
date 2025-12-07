import 'package:daamduuqr_ui/daamduuqr_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class CustomFilePicker extends StatelessWidget {
  const CustomFilePicker({
    super.key,
    required this.onPick,
    this.size = 140,
    this.loading = false,
    this.fileType = FileType.image,
  });

  final FileType fileType;
  final double size;
  final bool loading;
  final void Function(FilePickerResult) onPick;

  Future pick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: fileType,
    );
    if (result != null) {
      onPick(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: pick,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(color: theme.custom.transparent),
        child: FCard.raw(
          child: loading
              ? FCircularProgress()
              : Icon(Icons.add, color: theme.custom.mutedForeground, size: 32),
        ),
      ),
    );
  }
}
