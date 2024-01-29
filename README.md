# UnityAuth
Unity foundation security server

## Usage:
Insert this code to the client application.yaml file
```
  security:
    enabled: true
    token:
      enabled: true
      jwt:
        enabled: true
        signatures:
          jwks:
            unity:
              url: ${AUTH_JKWS:`http://localhost:8080/keys`}
```
AUTH_JKWS points to this service:

## How to create primary and seconday key
Go to the https://mkjwk.org/. Create the JSON Web Keys and define JWK_PRIMARY and JWK_SECONDARY environment variables with generated JSON Web Key (JWK).


