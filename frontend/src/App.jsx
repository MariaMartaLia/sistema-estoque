import { useEffect, useState } from "react";
import Dashboard from "./components/Dashboard";
import "./App.css";



function App() {
  const [produtos, setProdutos] = useState([]);

  return<Dashboard />;

useEffect(() => {
  fetch("http://127.0.0.1:8000/produtos")
    .then((res) => res.json())
    .then((data) => {
      console.log("Resposta da API:",data);
      setProdutos(data.produtos);
    })
    .catch((err) => console.error("Erro:",err));
}, []);

return(
  <div style={{padding: "20px"}}>
    <h1> Sistema de Estoque</h1>

    <table border="1" cellPadding="10">
      <thead>
        <tr>
          <th>ID</th>
           <th>Nome</th>
           <th>Quantidade</th>
            <th>Mínimo</th>
           </tr>
          </thead>
          <tbody>
            {produtos.map((p) => (
              <tr key={p[0]}>
                <td>{p[0]}</td>
                <td>{p[1]}</td>
                <td>{p[2]}</td>
                <td>{p[3]}</td>
                <td>{p[4]}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    );
  }

  export default App;