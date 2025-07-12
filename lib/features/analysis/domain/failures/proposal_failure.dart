import 'package:freezed_annotation/freezed_annotation.dart';

part 'proposal_failure.freezed.dart';

@freezed
sealed class ProposalFailure with _$ProposalFailure {
  factory ProposalFailure.insufficientData(String message) = _InsufficientData;
  factory ProposalFailure.noValidGroups(String message) = _NoValidGroups;
  factory ProposalFailure.invalidSelection(String message) = _InvalidSelection;
  factory ProposalFailure.processingError(String message) = _ProcessingError;
  factory ProposalFailure.unknown(String message) = _Unknown;
}