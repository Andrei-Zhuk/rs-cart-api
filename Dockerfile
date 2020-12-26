FROM node:14-alpine AS dependencies
COPY package*.json .
RUN npm install && npm cache clean --force

FROM dependencies as release
COPY tsconfig.json tsconfig.build.json ./
ADD /src src/
CMD [ "npm", "start" ]

# EXPOSE 3000
# WORKDIR /app
# ADD /config config/
# ADD /controllers controllers/
# ADD /middlewares middlewares/
# ADD /models models/
# ADD /redis redis/
# ADD /routers routers/
# ADD /schemas schemas/
# ADD /services services/
# ADD /utils utils/
# COPY app.js babel.config.js index.js package.json package-lock.json /app/
# RUN npm i
# CMD npm start