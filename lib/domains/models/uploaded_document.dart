// models/uploaded_document.dart
class UploadedDocument {
  String documentId;
  String documentType;
  String documentUrl;
  String status;

  UploadedDocument({
    required this.documentId,
    required this.documentType,
    required this.documentUrl,
    required this.status,
  });
}
