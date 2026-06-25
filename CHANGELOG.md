# Changelog

## 1.2.0

### Added

- **Account Lifecycle Flows**: added mobile routes and screens for email confirmation, confirmation resend, password reset with token deep links, and account deletion confirmation links.
- **GDPR/LGPD Data Controls**: added profile actions to export personal data and request account deletion with email confirmation, plus localized privacy and terms content describing collected data, local storage, AI processing, retention, and user rights.
- **Suggestion Management Parity**: users can now create richer document suggestions with title, authors, reference URL, and comments; edit pending suggestions; replace suggestion PDFs; view uploaded PDFs; and delete their own pending suggestions.
- **Public Profiles and Contributions**: added public profile routing by slug and public approved-suggestion lists, aligned with the backend public user contract.
- **Document Browsing Improvements**: added paginated document listing support with search metadata handling and improved document detail/download behavior.
- **Localized UX Coverage**: expanded English, Portuguese, Spanish, and French strings for auth flows, suggestions, profile editing, privacy, terms, export, deletion, and document actions.
- **Updated App Icons**: regenerated Android and iOS launcher icons from the new Agroecology Map AI logo assets.

### Changed

- **Backend Contract Alignment**: `getUserBySlug` now consumes the backend `PublicUser` response instead of the private `User` response, avoiding use of private-only fields on public community pages.
- **Login Layout**: moved the "Forgot password?" link to the bottom of the login screen, below the account registration prompt.
- **Auth API Integration**: centralized password reset, email confirmation, confirmation resend, logout, data export, and account deletion calls through the auth repository/controller.
- **Mobile Privacy Posture**: disabled Android cleartext traffic and removed unused iOS camera/location permission declarations; photo-library access remains limited to explicit avatar selection.
- **Chat Source Handling**: improved source-card rendering and document-link behavior for chat answers.

### Fixed

- Fixed the public profile crash risk caused by treating public user responses as full private user records.
- Fixed auth redirects so confirmation and deletion links can complete without being forced back into the authenticated shell.
- Fixed suggestion editing to allow only pending suggestions and to validate PDF replacement size/type before upload.
- Fixed document and suggestion list handling for paginated backend responses.

## 1.1.3

### Added

- **Academic Document Metadata**: document detail pages now display available academic metadata, including DOI, publication year, citation and reference counts, venue, publisher, confidence, source URLs, open access URLs, abstract, topics, keywords, license, and funder information.
- **Restrictive License Handling**: documents with restrictive publisher license URLs now hide full PDF download, inline preview, and fullscreen PDF viewing when full-file access is not allowed.
- **Localized Document Access Messages**: added localized labels and messages for restricted full-file access and academic metadata fields.

### Changed

- **Session Restore Navigation**: reopening the app with a valid saved session now routes directly to Chat instead of the landing page.
- **Token Refresh Flow**: token refresh handling is more robust for concurrent authenticated requests and avoids retrying refresh on the refresh endpoint itself.
- **Document PDF Access Guard**: direct PDF view navigation now verifies document type and full-file availability before loading the file.

### Fixed

- Prevented restricted PDFs from being previewed or opened directly from document detail screens.
- Prevented queued requests from surfacing unhandled refresh errors when token renewal fails.

## 1.1.1

### Added

- **Community Search Bar**: search field on the community list page, filtering users by name and slug in real-time (client-side).
- **Enhanced Suggestion Items**: approved suggestion items on profile and community detail pages now display authors, file type, file size, and ingested/indexed status — matching the knowledge base document list layout.
- **Localization**: added `searchCommunity` and `searchNoResults` i18n keys for all 4 languages (en, pt, es, fr).

### Changed

- **Clickable Suggestions**: tapping an approved suggestion on a user profile or community detail now navigates to the public document detail page (`/documents/:id`) instead of the authenticated suggestion detail page.
- **Icon Alignment**: document icon in suggestion list items is now vertically aligned with the title text.

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
