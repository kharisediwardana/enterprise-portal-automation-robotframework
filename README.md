# Enterprise Portal Test Automation Framework

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-6.0+-blue.svg)
![Selenium](https://img.shields.io/badge/Selenium-WebDriver-green.svg)
![Python](https://img.shields.io/badge/Python-3.9%20%7C%203.10%20%7C%203.11-yellow.svg)
![Architecture](https://img.shields.io/badge/Architecture-Layered%20Keyword--Driven-orange.svg)
![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)

> **Portfolio Showcase**: A resilient, enterprise-grade end-to-end (E2E) test automation suite designed for large-scale public citizen portals and back-office administrative case management workflows. Built with **Robot Framework**, **Selenium WebDriver**, **RequestsLibrary**, and **FakerLibrary**.

---

## 🏛️ Architecture & Design Pattern

This framework implements a **Layered Keyword-Driven Architecture** combined with the **Page Object Model (POM)** pattern to maximize maintainability, readability, and script reusability.

```
                           ┌──────────────────────────────┐
                           │      Test Specifications     │
                           │     (BDD Gherkin Syntax)     │
                           │  e_service/ & admin_portal/  │
                           └──────────────┬───────────────┘
                                          │
                                          ▼
                           ┌──────────────────────────────┐
                           │    Business Logic Layer      │
                           │     (keywords/logic/)        │
                           │ Composite user workflows &   │
                           │   domain-specific actions    │
                           └──────────────┬───────────────┘
                                          │
                                          ▼
                           ┌──────────────────────────────┐
                           │       Page Object Layer      │
                           │      (keywords/page/)        │
                           │  Element locators, UI state  │
                           │   assertions & DOM queries   │
                           └──────────────┬───────────────┘
                                          │
                    ┌─────────────────────┴─────────────────────┐
                    ▼                                           ▼
       ┌─────────────────────────┐                 ┌─────────────────────────┐
       │   Selenium WebDriver    │                 │    Requests / REST      │
       │    (UI Interactions)    │                 │ (Backend API Seed/Sync) │
       └─────────────────────────┘                 └─────────────────────────┘
```

### Key Architectural Separation:
1. **Tests Layer (`tests/`)**: High-level test scenarios written using business-readable BDD Gherkin terminology (`Given`, `When`, `Then`). No raw DOM locators or sleeps exist in this layer.
2. **Business Logic Layer (`keywords/logic/`)**: Orchestrates multi-step business actions (e.g., submitting an appeal, escalating a case, verifying role-based access).
3. **Page Object Layer (`keywords/page/`)**: Encapsulates component-level element locators (`id`, `xpath`, `css`) and fundamental assertions. UI changes only require updates in this layer.
4. **Helper & Utility Layer (`helper.robot`)**: Cross-cutting utilities including JavaScript viewport scroll helpers, dynamic Faker mock generators, and resilient wait wrappers.

---

## 🌟 Key Engineering Highlights

### 1. Resilient Dynamic Wait Strategy
To eliminate test flakiness caused by asynchronous UI rendering and animations, arbitrary `Sleep` calls were replaced with a tiered dynamic wait strategy:
- `${TURBO_TIMEOUT}` (1s) — Micro-waits for inline CSS state transitions.
- `${SHORT_TIMEOUT}` (3s) — Input readiness and fast button state changes.
- `${MEDIUM_TIMEOUT}` (5s) — Modal dialogues, alerts, and table row rendering.
- `${LONG_TIMEOUT}` (10s) — Heavy asynchronous data fetching and report downloads.

### 2. Multi-Format File Upload Verification Matrix
The suite validates document handling and backend ingestion rules across 20+ file formats (`.pdf`, `.docx`, `.xlsx`, `.csv`, `.png`, `.jpg`, `.zip`, and invalid extensions). It automatically verifies:
- MIME-type security validation.
- File size boundary restrictions.
- Batch notice processing via structured CSV ingestion.

### 3. Hybrid UI & REST API Testing
Back-end test state preparation is accelerated by combining UI tests with REST API keywords (`tests/api/api_test.robot`):
- Provisions test entities directly via HTTP requests in milliseconds.
- Triggers backend synchronization jobs (`/sync-data/pull-case`) to verify state transitions without slow manual UI traversals.

### 4. Multi-Environment Isolation (SIT & Staging)
Zero hardcoding of URLs or environment-dependent credentials. Switching between `SIT` and `Staging` environments is managed via external configuration variables:
```bash
# Run against SIT
robot --variablefile config/environment_sit.robot tests/

# Run against Staging
robot --variablefile config/environment_staging.robot tests/
```

### 5. Automated Triage & Failure Diagnostics
- Custom `TestTeardown.robot` automatically captures timestamped full-page screenshots whenever a test fails.
- Preserves network and session cookies while ensuring browser instances are cleanly destroyed between test runs to avoid state leakage.

---

## 📁 Repository Structure

```
├── config/
│   ├── environment_sit.robot       # SIT environment endpoint definitions & mock data
│   └── environment_staging.robot   # Staging environment endpoint definitions
├── keywords/
│   ├── logic/                      # High-level business actions & workflow logic
│   │   ├── e_service_portal_logic.robot
│   │   ├── staff_portal_logic.robot
│   │   ├── notices_logic.robot
│   │   └── furnish_driver_logic.robot
│   └── page/                       # Page Object locators & DOM assertions
│       ├── e_service_portal_page.robot
│       ├── staff_portal_page.robot
│       ├── notices_page.robot
│       └── furnish_driver_page.robot
├── tests/
│   ├── TestSetup.robot             # Suite & test initialization lifecycle
│   ├── TestTeardown.robot          # Dynamic screenshot captures on failure
│   ├── api/                        # REST API state provisioning suite
│   │   └── api_test.robot
│   ├── e_service/                  # Public citizen portal test suites
│   │   ├── e-serviceCreate.robot
│   │   └── e-serviceSearch.robot
│   └── admin_portal/               # Back-office officer & admin portal suites
│       ├── createCase.robot
│       ├── appealProccesing.robot
│       ├── temporarySuspend.robot
│       └── ocms_CreateNotice.robot
├── Media/                          # Test asset repository for multi-format upload tests
├── .github/workflows/              # Continuous Integration (GitHub Actions)
│   └── regression.yml
├── helper.robot                    # Viewport scrolling, dynamic faker data utilities
├── resources.robot                 # Master import orchestrator & shared variables
├── requirements.txt                # Python dependencies
└── .env.example                    # Environment variable template
```

---

## 🚀 Quickstart & Execution

### 1. Prerequisites
- Python 3.9+
- Google Chrome & ChromeDriver (managed automatically via Selenium)

### 2. Setup Virtual Environment
```bash
# Clone the repository
git clone https://github.com/your-username/enterprise-portal-automation.git
cd enterprise-portal-automation

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### 3. Run Test Suites
```bash
# Run all Smoke tests
robot --include Smoke --outputdir results tests/

# Run full e-Service citizen portal regression
robot --outputdir results tests/e_service/

# Run tests in Headless Chrome (suitable for CI/CD servers)
robot --variable HEADLESS:true --outputdir results tests/

# Run tests with tag filtering (e.g. PLUS12 feature tags)
robot --include PLUS12 --outputdir results tests/admin_portal/
```

---

## 📊 Test Reporting & Analytics

Robot Framework automatically generates detailed execution reports upon test completion in the `results/` directory:
- **`report.html`**: Executive-level summary with pass/fail ratios, tags, and execution duration.
- **`log.html`**: Granular debug log showing timestamped keyword calls, arguments, and embedded failure screenshots.
- **`output.xml`**: Machine-readable test execution output for CI/CD test dashboard parsing.

---

## 🛠️ Tech Stack & Libraries

| Category | Technology |
|---|---|
| **Core Framework** | Robot Framework 6.x |
| **Web Automation** | Selenium2Library / Selenium 4 |
| **API Automation** | RequestsLibrary |
| **Mock Data Generation** | FakerLibrary |
| **CI/CD** | GitHub Actions |
| **Language** | Python 3 |

---

## 📄 License
This repository is released under the [MIT License](LICENSE).
