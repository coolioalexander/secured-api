FROM quay.io/keycloak/keycloak:24.0.3 as builder

# Switch to root to install
USER root

WORKDIR /opt/keycloak

# Build a lightweight Keycloak distribution
RUN /opt/keycloak/bin/kc.sh build

# ---------------- Runtime Stage ----------------
FROM quay.io/keycloak/keycloak:24.0.3

WORKDIR /opt/keycloak

# Copy built server from builder
COPY --from=builder /opt/keycloak /opt/keycloak

# Copy realm configuration
COPY realm-export.json /opt/keycloak/data/import/realm-export.json

# Expose default ports
EXPOSE 8080

# Start with import of realm file
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]