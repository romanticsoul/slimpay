FROM node:18-alpine

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm ci

COPY src ./src
COPY public ./public
COPY tailwind.config.ts .
COPY postcss.config.mjs .
COPY next.config.ts .
COPY tsconfig.json .

# Next.js collects completely anonymous telemetry data about general usage. Learn more here: https://nextjs.org/telemetry
# Uncomment the following line to disable telemetry at run time
ENV NEXT_TELEMETRY_DISABLED 1

# Note: Don't expose ports here, Compose will handle that for us

# Start Next.js in development mode based on the preferred package manager
CMD npm run dev