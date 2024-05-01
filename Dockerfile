# Use the official Windows-based Node.js 14 image
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN mkdir C:\nginx\html

COPY --from=build /app/build /nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
