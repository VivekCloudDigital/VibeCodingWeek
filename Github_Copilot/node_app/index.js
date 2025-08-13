const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello from Inought Service on Elastic Beanstalk!');
});

app.listen(port, () => {
  console.log(`Inought Service running on port ${port}`);
});
