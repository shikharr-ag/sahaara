// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JournalEntryModelCWProxy {
  JournalEntryModel journalId(String journalId);

  JournalEntryModel journalContent(String journalContent);

  JournalEntryModel journalNumber(int journalNumber);

  JournalEntryModel journalTitle(String journalTitle);

  JournalEntryModel goalsState(Map<String, bool> goalsState);

  JournalEntryModel createdAt(DateTime createdAt);

  JournalEntryModel createdByUser(bool createdByUser);

  JournalEntryModel journalState(JournalState journalState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JournalEntryModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JournalEntryModel(...).copyWith(id: 12, name: "My name")
  /// ````
  JournalEntryModel call({
    String? journalId,
    String? journalContent,
    int? journalNumber,
    String? journalTitle,
    Map<String, bool>? goalsState,
    DateTime? createdAt,
    bool? createdByUser,
    JournalState? journalState,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJournalEntryModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJournalEntryModel.copyWith.fieldName(...)`
class _$JournalEntryModelCWProxyImpl implements _$JournalEntryModelCWProxy {
  const _$JournalEntryModelCWProxyImpl(this._value);

  final JournalEntryModel _value;

  @override
  JournalEntryModel journalId(String journalId) => this(journalId: journalId);

  @override
  JournalEntryModel journalContent(String journalContent) =>
      this(journalContent: journalContent);

  @override
  JournalEntryModel journalNumber(int journalNumber) =>
      this(journalNumber: journalNumber);

  @override
  JournalEntryModel journalTitle(String journalTitle) =>
      this(journalTitle: journalTitle);

  @override
  JournalEntryModel goalsState(Map<String, bool> goalsState) =>
      this(goalsState: goalsState);

  @override
  JournalEntryModel createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  JournalEntryModel createdByUser(bool createdByUser) =>
      this(createdByUser: createdByUser);

  @override
  JournalEntryModel journalState(JournalState journalState) =>
      this(journalState: journalState);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JournalEntryModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JournalEntryModel(...).copyWith(id: 12, name: "My name")
  /// ````
  JournalEntryModel call({
    Object? journalId = const $CopyWithPlaceholder(),
    Object? journalContent = const $CopyWithPlaceholder(),
    Object? journalNumber = const $CopyWithPlaceholder(),
    Object? journalTitle = const $CopyWithPlaceholder(),
    Object? goalsState = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? createdByUser = const $CopyWithPlaceholder(),
    Object? journalState = const $CopyWithPlaceholder(),
  }) {
    return JournalEntryModel(
      journalId: journalId == const $CopyWithPlaceholder() || journalId == null
          ? _value.journalId
          // ignore: cast_nullable_to_non_nullable
          : journalId as String,
      journalContent: journalContent == const $CopyWithPlaceholder() ||
              journalContent == null
          ? _value.journalContent
          // ignore: cast_nullable_to_non_nullable
          : journalContent as String,
      journalNumber:
          journalNumber == const $CopyWithPlaceholder() || journalNumber == null
              ? _value.journalNumber
              // ignore: cast_nullable_to_non_nullable
              : journalNumber as int,
      journalTitle:
          journalTitle == const $CopyWithPlaceholder() || journalTitle == null
              ? _value.journalTitle
              // ignore: cast_nullable_to_non_nullable
              : journalTitle as String,
      goalsState:
          goalsState == const $CopyWithPlaceholder() || goalsState == null
              ? _value.goalsState
              // ignore: cast_nullable_to_non_nullable
              : goalsState as Map<String, bool>,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      createdByUser:
          createdByUser == const $CopyWithPlaceholder() || createdByUser == null
              ? _value.createdByUser
              // ignore: cast_nullable_to_non_nullable
              : createdByUser as bool,
      journalState:
          journalState == const $CopyWithPlaceholder() || journalState == null
              ? _value.journalState
              // ignore: cast_nullable_to_non_nullable
              : journalState as JournalState,
    );
  }
}

extension $JournalEntryModelCopyWith on JournalEntryModel {
  /// Returns a callable class that can be used as follows: `instanceOfJournalEntryModel.copyWith(...)` or like so:`instanceOfJournalEntryModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JournalEntryModelCWProxy get copyWith =>
      _$JournalEntryModelCWProxyImpl(this);
}
