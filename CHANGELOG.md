# Changelog

## 1.1.0

### Added

- **PDF Preview on Document Detail**: inline PDF preview below metadata on the document detail page, showing the first page as a static thumbnail. Available for PDF documents only.
- **Fullscreen PDF Viewer**: "View Document" button opens a dedicated fullscreen page (`/documents/:id/view`) with native PDF rendering and free vertical scroll navigation.
- **Source Links in Chat**: chat source cards are now tappable when a `document_id` is available. Tapping a source card navigates directly to the corresponding document detail page. A `chevron_right` icon indicates tappable sources.
- **Document Repository**: added `getViewUrl()` method to `DocumentRepository` interface and `viewUrl()` to `DocumentApiDataSource`.

### Changed

- Document detail page layout: static inline PDF preview replaces interactive swipe, reducing gesture conflicts. Fullscreen navigation moved to a dedicated primary-styled button below the preview.
- Knowledge Base banner now shows only the real count of indexed documents, removing the progress bar and total count.

### Dependencies

- Added `flutter_pdfview: ^1.4.4` for native PDF rendering.

## 1.0.0

- Initial release.
