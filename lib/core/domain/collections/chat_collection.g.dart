// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChatCollectionCollection on Isar {
  IsarCollection<ChatCollection> get chatCollections => this.collection();
}

const ChatCollectionSchema = CollectionSchema(
  name: r'ChatCollection',
  id: -6047848219690401650,
  properties: {
    r'messages': PropertySchema(
      id: 0,
      name: r'messages',
      type: IsarType.objectList,
      target: r'ChatMessage',
    )
  },
  estimateSize: _chatCollectionEstimateSize,
  serialize: _chatCollectionSerialize,
  deserialize: _chatCollectionDeserialize,
  deserializeProp: _chatCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ChatMessage': ChatMessageSchema},
  getId: _chatCollectionGetId,
  getLinks: _chatCollectionGetLinks,
  attach: _chatCollectionAttach,
  version: '3.1.0+1',
);

int _chatCollectionEstimateSize(
  ChatCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.messages.length * 3;
  {
    final offsets = allOffsets[ChatMessage]!;
    for (var i = 0; i < object.messages.length; i++) {
      final value = object.messages[i];
      bytesCount += ChatMessageSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _chatCollectionSerialize(
  ChatCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ChatMessage>(
    offsets[0],
    allOffsets,
    ChatMessageSchema.serialize,
    object.messages,
  );
}

ChatCollection _chatCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChatCollection(
    reader.readObjectList<ChatMessage>(
          offsets[0],
          ChatMessageSchema.deserialize,
          allOffsets,
          ChatMessage(),
        ) ??
        [],
  );
  object.id = id;
  return object;
}

P _chatCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ChatMessage>(
            offset,
            ChatMessageSchema.deserialize,
            allOffsets,
            ChatMessage(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chatCollectionGetId(ChatCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chatCollectionGetLinks(ChatCollection object) {
  return [];
}

void _chatCollectionAttach(
    IsarCollection<dynamic> col, Id id, ChatCollection object) {
  object.id = id;
}

extension ChatCollectionQueryWhereSort
    on QueryBuilder<ChatCollection, ChatCollection, QWhere> {
  QueryBuilder<ChatCollection, ChatCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChatCollectionQueryWhere
    on QueryBuilder<ChatCollection, ChatCollection, QWhereClause> {
  QueryBuilder<ChatCollection, ChatCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChatCollectionQueryFilter
    on QueryBuilder<ChatCollection, ChatCollection, QFilterCondition> {
  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition>
      messagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition>
      messagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition>
      messagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition>
      messagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition>
      messagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition>
      messagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'messages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ChatCollectionQueryObject
    on QueryBuilder<ChatCollection, ChatCollection, QFilterCondition> {
  QueryBuilder<ChatCollection, ChatCollection, QAfterFilterCondition>
      messagesElement(FilterQuery<ChatMessage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'messages');
    });
  }
}

extension ChatCollectionQueryLinks
    on QueryBuilder<ChatCollection, ChatCollection, QFilterCondition> {}

extension ChatCollectionQuerySortBy
    on QueryBuilder<ChatCollection, ChatCollection, QSortBy> {}

extension ChatCollectionQuerySortThenBy
    on QueryBuilder<ChatCollection, ChatCollection, QSortThenBy> {
  QueryBuilder<ChatCollection, ChatCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChatCollection, ChatCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ChatCollectionQueryWhereDistinct
    on QueryBuilder<ChatCollection, ChatCollection, QDistinct> {}

extension ChatCollectionQueryProperty
    on QueryBuilder<ChatCollection, ChatCollection, QQueryProperty> {
  QueryBuilder<ChatCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChatCollection, List<ChatMessage>, QQueryOperations>
      messagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'messages');
    });
  }
}
