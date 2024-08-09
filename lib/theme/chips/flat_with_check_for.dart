import 'package:flutter/material.dart';

import '../../updat.dart';

Widget flatChipWithCheckFor({
  required BuildContext context,
  required String? latestVersion,
  required String appVersion,
  required UpdatStatus status,
  required void Function() checkForUpdate,
  required void Function() openDialog,
  required void Function() startUpdate,
  required Future<void> Function() launchInstaller,
  required void Function() dismissUpdate,
}) {
  if (UpdatStatus.available == status ||
      UpdatStatus.availableWithChangelog == status) {
    return Tooltip(
      message: '升级到版本v${latestVersion!.toString()}',
      child: TextButton.icon(
        onPressed: openDialog,
        icon: const Icon(Icons.system_update_alt_rounded),
        label: const Text('更新已就绪'),
      ),
    );
  }

  if (UpdatStatus.downloading == status) {
    return Tooltip(
      message: '请等待...',
      child: TextButton.icon(
        onPressed: () {},
        icon: const SizedBox(
          width: 15,
          height: 15,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
        label: const Text('下载中...'),
      ),
    );
  }

  if (UpdatStatus.readyToInstall == status) {
    return Tooltip(
      message: '点击安装',
      child: TextButton.icon(
        onPressed: launchInstaller,
        icon: const Icon(Icons.check_circle),
        label: const Text('等待安装'),
      ),
    );
  }

  if (UpdatStatus.error == status) {
    return Tooltip(
      message: '升级时遇到了一些问题. 请再次尝试.',
      child: TextButton.icon(
        onPressed: startUpdate,
        icon: const Icon(Icons.warning),
        label: const Text('错误. 重试.'),
      ),
    );
  }

  if (UpdatStatus.idle == status) {
    return Tooltip(
      message: '点击检查更新',
      child: TextButton.icon(
        onPressed: checkForUpdate,
        icon: const Icon(Icons.refresh_rounded),
        label: const Text('检查更新'),
      ),
    );
  }

  if (UpdatStatus.upToDate == status) {
    return Tooltip(
      message: '点击检查更新',
      child: TextButton.icon(
        onPressed: checkForUpdate,
        icon: const Icon(Icons.check_circle),
        label: const Text('已是最新版'),
      ),
    );
  }

  if (UpdatStatus.checking == status) {
    return Tooltip(
      message: '请等待...',
      child: TextButton.icon(
        onPressed: () {},
        icon: const SizedBox(
          width: 15,
          height: 15,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
        label: const Text('正在检查更新...'),
      ),
    );
  }

  return Container();
}
