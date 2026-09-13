# Entity Relationships & ERD

## Entity-Relationship Diagram

```mermaid
erDiagram
    USER ||--o{ ORDER : places
    ORDER ||--|{ ORDER_ITEM : contains
    PRODUCT ||--o{ ORDER_ITEM : referenced_in
```

## Cardinality & Multiplicity Details

## Referential Integrity & Foreign Key Mappings
