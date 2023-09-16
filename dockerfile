FROM node AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
RUN ls
RUN ls /app/dist/

FROM nginx
COPY --from=build /app/dist/akbar-app/ /usr/share/nginx/html/
