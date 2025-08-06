FROM node AS builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# /app/build the main dir for production

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
