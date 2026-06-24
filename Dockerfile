FROM ghcr.io/pnpm/pnpm:11
RUN pnpm runtime set node 22 -g

WORKDIR /app

COPY pnpm-workspace.yaml .
COPY pnpm-lock.yaml .
COPY package.json .
RUN pnpm install --frozen-lockfile

COPY content content
COPY main.ts .

# COPY . .

CMD ["pnpm", "dev"]