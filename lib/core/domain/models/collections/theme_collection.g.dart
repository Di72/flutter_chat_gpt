// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetThemeCollectionCollection on Isar {
  IsarCollection<ThemeCollection> get themeCollections => this.collection();
}

const ThemeCollectionSchema = CollectionSchema(
  name: r'ThemeCollection',
  id: -557687814254392943,
  properties: {
    r'theme': PropertySchema(
      id: 0,
      name: r'theme',
      type: IsarType.byte,
      enumMap: _ThemeCollectionthemeEnumValueMap,
    )
  },
  estimateSize: _themeCollectionEstimateSize,
  serialize: _themeCollectionSerialize,
  deserialize: _themeCollectionDeserialize,
  deserializeProp: _themeCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _themeCollectionGetId,
  getLinks: _themeCollectionGetLinks,
  attach: _themeCollectionAttach,
  version: '3.1.0+1',
);

int _themeCollectionEstimateSize(
  ThemeCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _themeCollectionSerialize(
  ThemeCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.theme.index);
}

ThemeCollection _themeCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ThemeCollection(
    _ThemeCollectionthemeValueEnumMap[reader.readByteOrNull(offsets[0])] ??
        ThemeMode.system,
  );
  object.id = id;
  return object;
}

P _themeCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_ThemeCollectionthemeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ThemeMode.system) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ThemeCollectionthemeEnumValueMap = {
  'system': 0,
  'light': 1,
  'dark': 2,
};
const _ThemeCollectionthemeValueEnumMap = {
  0: ThemeMode.system,
  1: ThemeMode.light,
  2: ThemeMode.dark,
};

Id _themeCollectionGetId(ThemeCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _themeCollectionGetLinks(ThemeCollection object) {
  return [];
}

void _themeCollectionAttach(
    IsarCollection<dynamic> col, Id id, ThemeCollection object) {
  object.id = id;
}

extension ThemeCollectionQueryWhereSort
    on QueryBuilder<ThemeCollection, ThemeCollection, QWhere> {
  QueryBuilder<ThemeCollection, ThemeCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ThemeCollectionQueryWhere
    on QueryBuilder<ThemeCollection, ThemeCollection, QWhereClause> {
  QueryBuilder<ThemeCollection, ThemeCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterWhereClause> idBetween(
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

extension ThemeCollectionQueryFilter
    on QueryBuilder<ThemeCollection, ThemeCollection, QFilterCondition> {
  QueryBuilder<ThemeCollection, ThemeCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterFilterCondition>
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

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterFilterCondition>
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

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterFilterCondition>
      themeEqualTo(ThemeMode value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theme',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterFilterCondition>
      themeGreaterThan(
    ThemeMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'theme',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterFilterCondition>
      themeLessThan(
    ThemeMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'theme',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterFilterCondition>
      themeBetween(
    ThemeMode lower,
    ThemeMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'theme',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ThemeCollectionQueryObject
    on QueryBuilder<ThemeCollection, ThemeCollection, QFilterCondition> {}

extension ThemeCollectionQueryLinks
    on QueryBuilder<ThemeCollection, ThemeCollection, QFilterCondition> {}

extension ThemeCollectionQuerySortBy
    on QueryBuilder<ThemeCollection, ThemeCollection, QSortBy> {
  QueryBuilder<ThemeCollection, ThemeCollection, QAfterSortBy> sortByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterSortBy>
      sortByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }
}

extension ThemeCollectionQuerySortThenBy
    on QueryBuilder<ThemeCollection, ThemeCollection, QSortThenBy> {
  QueryBuilder<ThemeCollection, ThemeCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterSortBy> thenByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<ThemeCollection, ThemeCollection, QAfterSortBy>
      thenByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }
}

extension ThemeCollectionQueryWhereDistinct
    on QueryBuilder<ThemeCollection, ThemeCollection, QDistinct> {
  QueryBuilder<ThemeCollection, ThemeCollection, QDistinct> distinctByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theme');
    });
  }
}

extension ThemeCollectionQueryProperty
    on QueryBuilder<ThemeCollection, ThemeCollection, QQueryProperty> {
  QueryBuilder<ThemeCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ThemeCollection, ThemeMode, QQueryOperations> themeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theme');
    });
  }
}
