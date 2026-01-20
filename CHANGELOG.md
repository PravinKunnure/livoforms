# Changelog

All notable changes to this project will be documented in this file.

This project follows **Semantic Versioning**.

---

## [1.0.1] – 2026-01-20
- Minor documentation changes

## [1.0.0] – 2026-01-20
### Added
- Official release of **LIVO Forms** (successor to `reactive_orm_forms`)
- Fully reactive Flutter form widgets integrated with **LIVO**:
  - `ReactiveTextField` – Text input bound to a reactive model field
  - `ReactiveCheckbox` – Boolean input
  - `ReactiveSwitch` – Toggle input
  - `ReactiveSelectorF` –  Selector
  - `ReactiveDropdown` – Generic dropdown
  - `ReactiveDatePicker` – Date input
  - `ReactiveSlider` – Slider input
- Field-wise and object-wise reactivity using **watchField()** and **watchComputed()**
- Nested and shared model support for complex form data
- Minimal boilerplate; fully declarative reactive forms
- Demo examples updated to reflect **LIVO** branding and usage

### Changed
- Rebranded package from `reactive_orm_forms` → `livoforms`
- Updated all imports to use **`livo`** and **`livoforms`**
- README, badges, examples, and documentation fully updated
- Migration notes added for previous users of `reactive_orm_forms`
- Enhanced example app to demonstrate nested models, computed fields, and field-level reactivity

### Fixed
- Resolved minor issues with field propagation in complex nested models
- Ensured all widgets rebuild safely with field-specific notifications
- Updated demo GIFs and visuals for clarity

### Notes
- **`reactive_orm_forms` is deprecated**; users should migrate to **LIVO Forms**
- All APIs remain backward-compatible for existing reactive model patterns
- Leverages **LIVO’s Reactive Object–Relationship Model** for field- and object-level updates
- Fully supports Many → One and Many ↔ Many relationships in forms
- Future roadmap: optional annotation-based code generation for form models, advanced dev tools, performance profiling helpers

---
