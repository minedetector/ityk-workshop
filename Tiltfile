# Tiltfile - Development configuration for Kubernetes

allow_k8s_contexts('docker-desktop')

# Build Docker image with live update capabilities
docker_build(
    # Image name (must match deployment.yaml)
    'ityk-workshop',

    # Build context
    context='.',

    # Dockerfile location
    dockerfile='./Dockerfile',

    # Live update configuration - THE MAGIC PART
    live_update=[
        # If Dockerfile changes, do full rebuild
        fall_back_on(['./Dockerfile']),
        # Sync HTML files to running container (fast!)
        sync('./html', '/usr/share/nginx/html'),

    ],
)

# Apply Kubernetes manifests
k8s_yaml([
    'k8s/namespace.yaml',
    'k8s/configmap.yaml',
    'k8s/deployment.yaml',
    'k8s/service.yaml',
    'k8s/ingress.yaml',
])

# Configure resource
k8s_resource(
    # Resource name (from deployment metadata.name)
    'web',

    # Port forward for easy access
    port_forwards='8080:80',

    # Labels for organization in Tilt UI
    labels=['frontend'],
)

# Display helpful message
print("""
╔══════════════════════════════════════════════════════════╗
║  Microservices Demo - Tilt Configuration                ║
║                                                          ║
║  After 'tilt up':                                        ║
║  - Tilt UI:         http://localhost:10350               ║
║  - Application:     http://localhost (via Ingress)       ║
║  - Port Forward:    http://localhost:8080                ║
║                                                          ║
║  Try editing html/index.html and watch live updates!    ║
╚══════════════════════════════════════════════════════════╝
""")
