import 'package:flutter/material.dart';

import '../../updat.dart';

void defaultDialog({
  required BuildContext context,
  required String? latestVersion,
  required String appVersion,
  required UpdatStatus status,
  required String? changelog,
  required void Function() checkForUpdate,
  required void Function() openDialog,
  required void Function() startUpdate,
  required Future<void> Function() launchInstaller,
  required void Function() dismissUpdate,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      scrollable: true,
      title: Flex(
        direction:
            Theme.of(context).useMaterial3 ? Axis.vertical : Axis.horizontal,
        children: const [
          Icon(Icons.update),
          Text('发现新版本'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          Text('版本号: v${latestVersion!.toString()}'),
          const SizedBox(height: 10),
          if (status == UpdatStatus.availableWithChangelog) ...[
            Text(
              '更新内容:',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(changelog!),
            ),
          ],
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('以后再说'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            startUpdate();
          },
          child: const Text('立即更新'),
        ),
      ],
    ),
  );
}
