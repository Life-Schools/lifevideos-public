#!/bin/sh

#!/bin/sh
# Ensure the upload directory exists and has correct permissions
mkdir -p /app/uploads/channels/
chmod -R 777 /app/uploads/

npx prisma migrate deploy

# Start the Next.js server
exec "$@"
