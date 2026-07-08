# Changelog

## 1.3.0

### Added

- Registered Chat Conversations: chat history is now stored as backend conversations that users can reopen and continue later.
- Conversation Picker: added a conversation list with support for opening previous chats, starting a new saved conversation, and deleting an entire conversation.
- Backend Conversation API Integration: chat requests now send `conversation_id`, load persisted messages, and keep follow-up questions scoped to the selected conversation.

### Changed

- New Chat Flow: creating a new chat now creates a saved conversation instead of only clearing the current chat screen.
- First Question Titles: new conversations are titled from the first question when possible, replacing the generic "New Chat" label.
- Privacy Copy: updated localized privacy text to explain that chat conversations are saved to the user's account.

### Fixed

- Prevented follow-up context from mixing between separate conversations.
- Improved small-viewport chat history access with a compact conversation picker and delete action.

## 1.2.0

- Added GDPR/LGPD controls: data export, account deletion, consent, and updated privacy/terms content.
- Added email confirmation, password reset, and account deletion links in the app.
- Improved suggestions: create, edit pending items, replace PDFs, and view uploaded files.
- Updated public profiles, document lists, chat source links, login layout, and app icons.
- Academic Document Metadata: document detail pages now display available academic metadata, including DOI, publication year, citation and reference counts, venue, publisher, confidence, source URLs, open access URLs, abstract, topics, keywords, license, and funder information.
- Restrictive License Handling: documents with restrictive publisher license URLs now hide full PDF download, inline preview, and fullscreen PDF viewing when full-file access is not allowed.
- Localized Document Access Messages: added localized labels and messages for restricted full-file access and academic metadata fields.

## 1.1.3

### Added

- Localized Document Access Messages: added localized labels and messages for restricted full-file access and academic metadata fields.

### Changed

- Session Restore Navigation: reopening the app with a valid saved session now routes directly to Chat instead of the landing page.
- Token Refresh Flow: token refresh handling is more robust for concurrent authenticated requests and avoids retrying refresh on the refresh endpoint itself.
- Document PDF Access Guard: direct PDF view navigation now verifies document type and full-file availability before loading the file.

### Fixed

- Prevented restricted PDFs from being previewed or opened directly from document detail screens.
- Prevented queued requests from surfacing unhandled refresh errors when token renewal fails.

## 1.1.1

### Added

- Community Search Bar: search field on the community list page, filtering users by name and slug in real-time (client-side).
- Enhanced Suggestion Items: approved suggestion items on profile and community detail pages now display authors, file type, file size, and ingested/indexed status — matching the knowledge base document list layout.
- Localization: added `searchCommunity` and `searchNoResults` i18n keys for all 4 languages (en, pt, es, fr).

### Changed

- Clickable Suggestions: tapping an approved suggestion on a user profile or community detail now navigates to the public document detail page (`/documents/:id`) instead of the authenticated suggestion detail page.
- Icon Alignment: document icon in suggestion list items is now vertically aligned with the title text.

## 1.1.0

### Added

- PDF Preview on Document Detail: inline PDF preview below metadata on the document detail page, showing the first page as a static thumbnail. Available for PDF documents only.
- Fullscreen PDF Viewer: "View Document" button opens a dedicated fullscreen page (`/documents/:id/view`) with native PDF rendering and free vertical scroll navigation.
- Source Links in Chat: chat source cards are now tappable when a `document_id` is available. Tapping a source card navigates directly to the corresponding document detail page. A `chevron_right` icon indicates tappable sources.
- Document Repository: added `getViewUrl()` method to `DocumentRepository` interface and `viewUrl()` to `DocumentApiDataSource`.

### Changed

- Document detail page layout: static inline PDF preview replaces interactive swipe, reducing gesture conflicts. Fullscreen navigation moved to a dedicated primary-styled button below the preview.
- Knowledge Base banner now shows only the real count of indexed documents, removing the progress bar and total count.

### Dependencies

- Added `flutter_pdfview: ^1.4.4` for native PDF rendering.

## 1.0.0

- Initial release.
