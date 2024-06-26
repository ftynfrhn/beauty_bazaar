/*
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* Automatically generated nanopb constant definitions */
/* Generated by nanopb-0.3.9.8 */

#include "bundle.nanopb.h"

#include "Firestore/core/src/nanopb/pretty_printing.h"

namespace firebase {
namespace firestore {

using nanopb::PrintEnumField;
using nanopb::PrintHeader;
using nanopb::PrintMessageField;
using nanopb::PrintPrimitiveField;
using nanopb::PrintTail;

/* @@protoc_insertion_point(includes) */
#if PB_PROTO_HEADER_VERSION != 30
#error Regenerate this file with the current version of nanopb generator.
#endif



const pb_field_t firestore_BundledQuery_fields[4] = {
    PB_FIELD(  1, BYTES   , SINGULAR, POINTER , FIRST, firestore_BundledQuery, parent, parent, 0),
    PB_ANONYMOUS_ONEOF_FIELD(query_type,   2, MESSAGE , ONEOF, STATIC  , OTHER, firestore_BundledQuery, structured_query, parent, &google_firestore_v1_StructuredQuery_fields),
    PB_FIELD(  3, UENUM   , SINGULAR, STATIC  , OTHER, firestore_BundledQuery, limit_type, structured_query, 0),
    PB_LAST_FIELD
};

const pb_field_t firestore_NamedQuery_fields[4] = {
    PB_FIELD(  1, BYTES   , SINGULAR, POINTER , FIRST, firestore_NamedQuery, name, name, 0),
    PB_FIELD(  2, MESSAGE , SINGULAR, STATIC  , OTHER, firestore_NamedQuery, bundled_query, name, &firestore_BundledQuery_fields),
    PB_FIELD(  3, MESSAGE , SINGULAR, STATIC  , OTHER, firestore_NamedQuery, read_time, bundled_query, &google_protobuf_Timestamp_fields),
    PB_LAST_FIELD
};

const pb_field_t firestore_BundledDocumentMetadata_fields[5] = {
    PB_FIELD(  1, BYTES   , SINGULAR, POINTER , FIRST, firestore_BundledDocumentMetadata, name, name, 0),
    PB_FIELD(  2, MESSAGE , SINGULAR, STATIC  , OTHER, firestore_BundledDocumentMetadata, read_time, name, &google_protobuf_Timestamp_fields),
    PB_FIELD(  3, BOOL    , SINGULAR, STATIC  , OTHER, firestore_BundledDocumentMetadata, exists, read_time, 0),
    PB_FIELD(  4, BYTES   , REPEATED, POINTER , OTHER, firestore_BundledDocumentMetadata, queries, exists, 0),
    PB_LAST_FIELD
};

const pb_field_t firestore_BundleMetadata_fields[6] = {
    PB_FIELD(  1, BYTES   , SINGULAR, POINTER , FIRST, firestore_BundleMetadata, id, id, 0),
    PB_FIELD(  2, MESSAGE , SINGULAR, STATIC  , OTHER, firestore_BundleMetadata, create_time, id, &google_protobuf_Timestamp_fields),
    PB_FIELD(  3, UINT32  , SINGULAR, STATIC  , OTHER, firestore_BundleMetadata, version, create_time, 0),
    PB_FIELD(  4, UINT32  , SINGULAR, STATIC  , OTHER, firestore_BundleMetadata, total_documents, version, 0),
    PB_FIELD(  5, UINT64  , SINGULAR, STATIC  , OTHER, firestore_BundleMetadata, total_bytes, total_documents, 0),
    PB_LAST_FIELD
};

const pb_field_t firestore_BundleElement_fields[5] = {
    PB_ANONYMOUS_ONEOF_FIELD(element_type,   1, MESSAGE , ONEOF, STATIC  , FIRST, firestore_BundleElement, metadata, metadata, &firestore_BundleMetadata_fields),
    PB_ANONYMOUS_ONEOF_FIELD(element_type,   2, MESSAGE , ONEOF, STATIC  , UNION, firestore_BundleElement, named_query, named_query, &firestore_NamedQuery_fields),
    PB_ANONYMOUS_ONEOF_FIELD(element_type,   3, MESSAGE , ONEOF, STATIC  , UNION, firestore_BundleElement, document_metadata, document_metadata, &firestore_BundledDocumentMetadata_fields),
    PB_ANONYMOUS_ONEOF_FIELD(element_type,   4, MESSAGE , ONEOF, STATIC  , UNION, firestore_BundleElement, document, document, &google_firestore_v1_Document_fields),
    PB_LAST_FIELD
};



/* Check that field information fits in pb_field_t */
#if !defined(PB_FIELD_32BIT)
/* If you get an error here, it means that you need to define PB_FIELD_32BIT
 * compile-time option. You can do that in pb.h or on compiler command line.
 *
 * The reason you need to do this is that some of your messages contain tag
 * numbers or field sizes that are larger than what can fit in 8 or 16 bit
 * field descriptors.
 */
PB_STATIC_ASSERT((pb_membersize(firestore_BundledQuery, structured_query) < 65536 && pb_membersize(firestore_NamedQuery, bundled_query) < 65536 && pb_membersize(firestore_NamedQuery, read_time) < 65536 && pb_membersize(firestore_BundledDocumentMetadata, read_time) < 65536 && pb_membersize(firestore_BundleMetadata, create_time) < 65536 && pb_membersize(firestore_BundleElement, metadata) < 65536 && pb_membersize(firestore_BundleElement, named_query) < 65536 && pb_membersize(firestore_BundleElement, document_metadata) < 65536 && pb_membersize(firestore_BundleElement, document) < 65536), YOU_MUST_DEFINE_PB_FIELD_32BIT_FOR_MESSAGES_firestore_BundledQuery_firestore_NamedQuery_firestore_BundledDocumentMetadata_firestore_BundleMetadata_firestore_BundleElement)
#endif

#if !defined(PB_FIELD_16BIT) && !defined(PB_FIELD_32BIT)
/* If you get an error here, it means that you need to define PB_FIELD_16BIT
 * compile-time option. You can do that in pb.h or on compiler command line.
 *
 * The reason you need to do this is that some of your messages contain tag
 * numbers or field sizes that are larger than what can fit in the default
 * 8 bit descriptors.
 */
PB_STATIC_ASSERT((pb_membersize(firestore_BundledQuery, structured_query) < 256 && pb_membersize(firestore_NamedQuery, bundled_query) < 256 && pb_membersize(firestore_NamedQuery, read_time) < 256 && pb_membersize(firestore_BundledDocumentMetadata, read_time) < 256 && pb_membersize(firestore_BundleMetadata, create_time) < 256 && pb_membersize(firestore_BundleElement, metadata) < 256 && pb_membersize(firestore_BundleElement, named_query) < 256 && pb_membersize(firestore_BundleElement, document_metadata) < 256 && pb_membersize(firestore_BundleElement, document) < 256), YOU_MUST_DEFINE_PB_FIELD_16BIT_FOR_MESSAGES_firestore_BundledQuery_firestore_NamedQuery_firestore_BundledDocumentMetadata_firestore_BundleMetadata_firestore_BundleElement)
#endif


const char* EnumToString(
  firestore_BundledQuery_LimitType value) {
    switch (value) {
    case firestore_BundledQuery_LimitType_FIRST:
        return "FIRST";
    case firestore_BundledQuery_LimitType_LAST:
        return "LAST";
    }
    return "<unknown enum value>";
}

std::string firestore_BundledQuery::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "BundledQuery", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("parent: ",
        parent, indent + 1, false);
    switch (which_query_type) {
    case firestore_BundledQuery_structured_query_tag:
        tostring_result += PrintMessageField("structured_query ",
            structured_query, indent + 1, true);
        break;
    }
    tostring_result += PrintEnumField("limit_type: ",
        limit_type, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string firestore_NamedQuery::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "NamedQuery", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("name: ", name, indent + 1, false);
    tostring_result += PrintMessageField("bundled_query ",
        bundled_query, indent + 1, false);
    tostring_result += PrintMessageField("read_time ",
        read_time, indent + 1, false);

    std::string tostring_tail = PrintTail(indent);
    return tostring_header + tostring_result + tostring_tail;
}

std::string firestore_BundledDocumentMetadata::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "BundledDocumentMetadata", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("name: ", name, indent + 1, false);
    tostring_result += PrintMessageField("read_time ",
        read_time, indent + 1, false);
    tostring_result += PrintPrimitiveField("exists: ",
        exists, indent + 1, false);
    for (pb_size_t i = 0; i != queries_count; ++i) {
        tostring_result += PrintPrimitiveField("queries: ",
            queries[i], indent + 1, true);
    }

    std::string tostring_tail = PrintTail(indent);
    return tostring_header + tostring_result + tostring_tail;
}

std::string firestore_BundleMetadata::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "BundleMetadata", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("id: ", id, indent + 1, false);
    tostring_result += PrintMessageField("create_time ",
        create_time, indent + 1, false);
    tostring_result += PrintPrimitiveField("version: ",
        version, indent + 1, false);
    tostring_result += PrintPrimitiveField("total_documents: ",
        total_documents, indent + 1, false);
    tostring_result += PrintPrimitiveField("total_bytes: ",
        total_bytes, indent + 1, false);

    std::string tostring_tail = PrintTail(indent);
    return tostring_header + tostring_result + tostring_tail;
}

std::string firestore_BundleElement::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "BundleElement", this);
    std::string tostring_result;

    switch (which_element_type) {
    case firestore_BundleElement_metadata_tag:
        tostring_result += PrintMessageField("metadata ",
            metadata, indent + 1, true);
        break;
    case firestore_BundleElement_named_query_tag:
        tostring_result += PrintMessageField("named_query ",
            named_query, indent + 1, true);
        break;
    case firestore_BundleElement_document_metadata_tag:
        tostring_result += PrintMessageField("document_metadata ",
            document_metadata, indent + 1, true);
        break;
    case firestore_BundleElement_document_tag:
        tostring_result += PrintMessageField("document ",
            document, indent + 1, true);
        break;
    }

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

}  // namespace firestore
}  // namespace firebase

/* @@protoc_insertion_point(eof) */
