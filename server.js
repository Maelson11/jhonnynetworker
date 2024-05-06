const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');

const app = express();
app.use(express.json());

// Rota para executar as consultas
app.post('/consultar', (req, res) => {
  const db = new sqlite3.Database(':memory:');
  const consulta = req.body.consulta;

  // Executar o SQL do arquivo Alunos.sql
  const sql = fs.readFileSync('Alunos.sql', 'utf8');
  db.exec(sql, (err) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    // Executar a consulta especificada
    db.all(consulta, (err, rows) => {
      if (err) {
        return res.status(500).json({ error: err.message });
      }

      // Retornar os resultados como JSON
      res.json(rows);
    });
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
