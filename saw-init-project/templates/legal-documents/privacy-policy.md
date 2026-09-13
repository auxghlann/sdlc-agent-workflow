# Privacy Policy Specification

**Last Updated**: [YYYY-MM-DD]  
**Effective Date**: [YYYY-MM-DD]

---

## 1. Overview
[Application/Organization Name] ("we", "us", or "our") operates the application accessible at [Domain/URL]. This Privacy Policy describes how we collect, use, store, and protect your personal data when you access or use the platform, and outlines your rights under applicable data protection regulations (such as GDPR, CCPA, and applicable local data privacy laws).

We are committed to data minimization: collecting only the minimum data necessary to deliver the application's core functionality.

---

## 2. Information We Collect

### A. Authentication & Identity Data
When you register or sign in through third-party authentication providers (e.g., Google, GitHub, email OTP):
- **User Identifier**: Unique, opaque system ID linked to your account.
- **Email Address**: To authenticate sessions, provide service notifications, and support account recovery.
- **Name & Avatar**: Optional display metadata used solely for interface personalization.

> [!NOTE]
> We strictly request only minimal identity scopes (`openid`, `email`, `profile`). We never request, access, or scan private communications, unapproved cloud drives, or unrelated external accounts.

### B. User-Submitted Application Data
Information voluntarily entered into the application to use its features:
- Domain entities, records, configuration parameters, uploaded documents, or transaction notes.
- Custom metadata, categories, tags, and timeline markers.

### C. Technical, Session, and Diagnostic Data
- **Session Identifiers**: Secure HTTP-only cookies (`SameSite=Lax`, `Secure`) used strictly for session state.
- **Operational Logs**: Transient system error logs containing non-identifying telemetry to monitor application stability and resolve defects.

---

## 3. How We Use Your Information
We use your information exclusively for the following purposes:
- Delivering core application functionality and rendering personalized data views.
- Enforcing user authentication, session security, and tenant isolation.
- Generating user-requested data exports.

We strictly do **not**:
- Sell, rent, lease, or monetize your personal information to third-party data brokers or advertisers.
- Use your private application data or confidential notes to train public or commercial generalized machine learning models.
- Serve third-party behavioral advertisements within the application.

---

## 4. Data Storage, Security & Multi-Tenant Isolation

### A. Multi-Tenant Database Isolation
User data is stored in isolated relational partitions protected by database-level **Row Level Security (RLS)**. Every database query, mutation, and lookup is evaluated against the authenticated user's session identifier, preventing cross-tenant leakage at the storage engine level.

### B. Encryption in Transit and at Rest
- **Data in Transit**: All network communication is encrypted using Transport Layer Security (TLS 1.3 / HTTPS).
- **Data at Rest**: Storage volumes and database backups are encrypted at rest using industry-standard AES-256 encryption.
- **Sensitive Field Encryption**: Sensitive personal identifiers or external integration tokens are encrypted at the application layer before database insertion.

---

## 5. Third-Party Infrastructure Providers
We partner only with vetted infrastructure providers adhering to enterprise security standards (SOC 2 Type II, ISO 27001):
- **Authentication Provider**: Federated identity and session verification.
- **Database Infrastructure**: Managed database hosting with automated backups and RLS enforcement.
- **Application Hosting / CDN**: Scalable, high-availability edge routing and serverless execution.

---

## 6. User Rights, Data Retention & Erasure

### A. Ownership and Portability
You retain full ownership of all data you input into the application. You may export your complete data records at any time via in-app export tools.

### B. In-App Deletion
You may delete individual records, entries, or uploaded items directly in the interface. Deletions take immediate effect across all active views.

### C. Complete Account Erasure
Upon user request for account deletion:
- All database records, user profiles, session tokens, and encrypted credentials associated with the user ID are permanently purged from primary databases within thirty (30) days.
- Archived system backups overwrite and expire according to standard rotation schedules.

---

## 7. Contact Information
For privacy inquiries, data subject access requests, or deletion requests, contact:
- **Email**: [privacy@example.com]
- **Support Channel**: [https://example.com/support]
