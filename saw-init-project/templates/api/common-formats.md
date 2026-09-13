# Common Response & Error Formats

## Standard Success Envelope

```json
{
  "success": true,
  "data": {},
  "meta": {
    "timestamp": "ISO-8601"
  }
}
```

## Standard Error Envelope

```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable description",
    "details": []
  }
}
```

## Validation Error Format
