const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(bodyParser.json());

//routes here

app.listen(8000, () => {
	console.log(`Server is running.`);
});
