const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

// distフォルダ内の静的ファイルを提供
app.use(express.static('./build'));

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
