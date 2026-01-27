# Use specific Alpine version for reproducibility
FROM nginx:1.27.0-alpine


# Copy application files
COPY ./html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Health check for orchestration
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
