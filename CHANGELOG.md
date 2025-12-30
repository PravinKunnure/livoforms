# Changelog

All notable changes to this project will be documented in this file.

This project follows **Semantic Versioning**.

---

## [1.0.0] - 2025-12-30
### Added
- Initial release of `reactive_orm_forms`.
- Form widgets:
    - `ReactiveTextField`
    - `ReactiveCheckbox`
    - `ReactiveSelectorF` (Dropdown)
    - `ReactiveDatePicker`
    - `ReactiveSlider`
- Full support for field-wise reactivity with `ReactiveModel`.
- `ReactiveBuilder` integration for reactive previews.
- Nested and shared models supported.
- Minimal boilerplate, designed for rapid form development.

### Notes
- Requires `reactive_orm` >=1.0.0.
- All widgets fully reactive to model changes.
- Designed for Flutter apps with reactive domain models.