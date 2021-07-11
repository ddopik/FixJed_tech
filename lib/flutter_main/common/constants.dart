import 'package:flutter_base_app/generated/l10n.dart';

import 'model/DeclineReason.dart';

const APP_CURRENCY = "EGP";

class Constants {
  static const List<String> _DECLINE_REASONS_LIST_DATA = [
    "Shift End",
    "in Correct Info",
    "Vacation",
    "Wrong Address",
    "out dated"
  ];

  static const List<AssignedCancelReason> _DECLINE_REASONS_LIST_ID = [
    AssignedCancelReason.SHIFT_END,
    AssignedCancelReason.INCORRECT_INFO,
    AssignedCancelReason.VACATION,
    AssignedCancelReason.ADDRESS_MISMATCH,
    AssignedCancelReason.OUTDATED
  ];

  static List<DeclineReason> getDeclineReasonsList() {
    List<DeclineReason> declineReasonList = [];
    for (int i = 0; i < _DECLINE_REASONS_LIST_DATA.length; i++) {
      DeclineReason declineReason = DeclineReason();
      declineReason.id = _DECLINE_REASONS_LIST_ID[i];
      declineReason.data = _DECLINE_REASONS_LIST_DATA[i];
      declineReasonList.add(declineReason);
    }
    return declineReasonList;
  }

  static cancelingReasonsList() {
    return [
      {'reason': S.current.customerWasntAthome, 'id': ' CUSTOMER_NOT_AT_HOME'},
      {
        'reason': S.current.customerDidntAnswer,
        'id': ' CUSTOMER_NOT_ANSWER_CALLS'
      },
      {
        'reason': S.current.customerAskedToCancel,
        'id': 'CUSTOMER_ASKED_ME_TO_CANCEL'
      },
      {'reason': S.current.customerIsRude, 'id': 'CUSTOMER_IS_RUDE'},
      {
        'reason': S.current.othersAndIneedOneofOperationstoContactMe,
        'id': ' OTHER_OPERATIONS_TO_CONTACT_ME'
      },
    ];
  }
}

enum AssignedCancelReason {
  SHIFT_END,
  INCORRECT_INFO,
  VACATION,
  ADDRESS_MISMATCH,
  OUTDATED
}
