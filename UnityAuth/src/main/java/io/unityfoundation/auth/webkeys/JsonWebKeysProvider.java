/*
 * Copyright 2017-2024 original authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package io.unityfoundation.auth.webkeys;

import com.nimbusds.jose.jwk.JWK;
import io.micronaut.runtime.context.scope.Refreshable;
import io.micronaut.security.token.jwt.endpoints.JwkProvider;
import java.util.Arrays;
import java.util.List;

@Refreshable
public class JsonWebKeysProvider implements JwkProvider {

    private final List<JWK> jwks;

    public JsonWebKeysProvider(PrimarySignatureConfiguration primaryRsaPrivateKey,
                               SecondarySignatureConfiguration secondarySignatureConfiguration) {
        jwks = Arrays.asList(primaryRsaPrivateKey.getPublicJWK(), secondarySignatureConfiguration.getPublicJWK());
    }

    @Override
    public List<JWK> retrieveJsonWebKeys() {
        return jwks;
    }
}
