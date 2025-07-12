// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_proposal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaylistProposal _$PlaylistProposalFromJson(Map<String, dynamic> json) =>
    _PlaylistProposal(
      id: json['id'] as String,
      suggestedName: json['suggestedName'] as String,
      description: json['description'] as String,
      criteria: (json['criteria'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      songs: (json['songs'] as List<dynamic>)
          .map((e) => SongClassification.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: ProposalMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isSelected: json['isSelected'] as bool,
    );

Map<String, dynamic> _$PlaylistProposalToJson(_PlaylistProposal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'suggestedName': instance.suggestedName,
      'description': instance.description,
      'criteria': instance.criteria,
      'songs': instance.songs,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'isSelected': instance.isSelected,
    };

_ProposalMetadata _$ProposalMetadataFromJson(Map<String, dynamic> json) =>
    _ProposalMetadata(
      strategy: $enumDecode(_$GroupingStrategyEnumMap, json['strategy']),
      primaryCriteria: (json['primaryCriteria'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      secondaryCriteria: (json['secondaryCriteria'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cohesionScore: (json['cohesionScore'] as num).toDouble(),
      estimatedDuration: Duration(
        microseconds: (json['estimatedDuration'] as num).toInt(),
      ),
      optimalSize: (json['optimalSize'] as num).toInt(),
      actualSize: (json['actualSize'] as num).toInt(),
      groupingParameters: json['groupingParameters'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ProposalMetadataToJson(_ProposalMetadata instance) =>
    <String, dynamic>{
      'strategy': _$GroupingStrategyEnumMap[instance.strategy]!,
      'primaryCriteria': instance.primaryCriteria,
      'secondaryCriteria': instance.secondaryCriteria,
      'cohesionScore': instance.cohesionScore,
      'estimatedDuration': instance.estimatedDuration.inMicroseconds,
      'optimalSize': instance.optimalSize,
      'actualSize': instance.actualSize,
      'groupingParameters': instance.groupingParameters,
    };

const _$GroupingStrategyEnumMap = {
  GroupingStrategy.singleCriteria: 'singleCriteria',
  GroupingStrategy.multiCriteria: 'multiCriteria',
  GroupingStrategy.hybrid: 'hybrid',
  GroupingStrategy.similarity: 'similarity',
};

_PlaylistCreationRequest _$PlaylistCreationRequestFromJson(
  Map<String, dynamic> json,
) => _PlaylistCreationRequest(
  proposalId: json['proposalId'] as String,
  playlistName: json['playlistName'] as String,
  description: json['description'] as String,
  isPublic: json['isPublic'] as bool,
  trackIds: (json['trackIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$PlaylistCreationRequestToJson(
  _PlaylistCreationRequest instance,
) => <String, dynamic>{
  'proposalId': instance.proposalId,
  'playlistName': instance.playlistName,
  'description': instance.description,
  'isPublic': instance.isPublic,
  'trackIds': instance.trackIds,
  'metadata': instance.metadata,
};

_BatchCreationRequest _$BatchCreationRequestFromJson(
  Map<String, dynamic> json,
) => _BatchCreationRequest(
  requests: (json['requests'] as List<dynamic>)
      .map((e) => PlaylistCreationRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  userId: json['userId'] as String,
  requestedAt: DateTime.parse(json['requestedAt'] as String),
  options: json['options'] as Map<String, dynamic>,
);

Map<String, dynamic> _$BatchCreationRequestToJson(
  _BatchCreationRequest instance,
) => <String, dynamic>{
  'requests': instance.requests,
  'userId': instance.userId,
  'requestedAt': instance.requestedAt.toIso8601String(),
  'options': instance.options,
};
