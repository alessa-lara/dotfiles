mkdir $1
cd $1
npm init -y
echo "{
  \"name\": \"${1}\",
  \"version\": \"1.0.0\",
  \"description\": \"\",
  \"main\": \"index.js\",
  \"scripts\": {
    \"start\": \"node src/index.js\",
    \"start:dev\": \"nodemon src/index.js\",
    \"test\": \"echo \\\"Error: no test specified\\\" && exit 1\"
  },
  \"keywords\": [],
  \"author\": \"\",
  \"license\": \"ISC\"
}" > package.json

npm install --save-dev nodemon
npm install cors express
mkdir src
touch src/index.js

echo 'const express = require("express");
const cors = require("cors");

const app = express();
app.use( express.json() );
app.use( express.urlencoded( {extended: false} ) );
app.use( cors() );

app.listen(3001)' >> src/index.js
