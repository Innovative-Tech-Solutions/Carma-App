import 'package:carma_app/src/core/constants/enums.dart';
import 'package:carma_app/src/core/shared/dialog_box.dart';
import 'package:carma_app/src/core/utils/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.activationCode: (context, request, completer) =>
        ActivationCodeDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
