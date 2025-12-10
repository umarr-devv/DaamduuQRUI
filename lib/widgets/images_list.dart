import 'package:daamduuqr_ui/daamduuqr_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class CustomImagesList extends StatelessWidget {
  const CustomImagesList({
    super.key,
    this.size = 140,
    this.fileType = FileType.image,
    this.loading = false,
    this.onPick,
    this.imageUrls = const {},
    this.onDelete,
  });

  final double size;
  final Map<String, String> imageUrls;
  final void Function(String)? onDelete;
  final FileType fileType;
  final bool loading;
  final void Function(FilePickerResult)? onPick;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children:
          imageUrls.entries
              .map(
                (i) => _ListImageItem(
                  id: i.key,
                  imageUrl: i.value,
                  size: size,
                  onDelete: onDelete,
                ),
              )
              .cast<Widget>()
              .toList() +
          [
            if (onPick != null)
              CustomFilePicker(
                onPick: onPick!,
                loading: loading,
                fileType: fileType,
              ),
          ],
    );
  }
}

class _ListImageItem extends StatelessWidget {
  const _ListImageItem({
    required this.id,
    required this.size,
    required this.imageUrl,
    this.onDelete,
  });

  final String id;
  final String imageUrl;
  final double size;
  final void Function(String)? onDelete;

  Future onAcceptDelete(BuildContext context) async {
    await showFDialog(
      context: context,
      builder: (context, style, animation) {
        return FDialog(
          title: Text('Вы хотите удалить это изображение?'),
          body: Text(
            'После выполнения операции невозможно будет отменить действие',
          ),
          direction: Axis.horizontal,
          actions: [
            FButton(
              onPress: () {
                Navigator.pop(context);
              },
              style: FButtonStyle.outline(),
              child: Text('Отмена'),
            ),

            FButton(
              onPress: () {
                if (onDelete != null) {
                  onDelete!(id);
                }
                Navigator.pop(context);
              },
              style: FButtonStyle.destructive(),
              child: Text('Удалить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          FCard.raw(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              clipBehavior: Clip.antiAlias,
              child: CustomImage(url: imageUrl),
            ),
          ),
          if (onDelete != null)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: FButton.icon(
                  onPress: () async {
                    await onAcceptDelete(context);
                  },
                  style: FButtonStyle.secondary(),
                  child: Icon(Icons.delete),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
