import { useEffect, useState } from "react";

function TabelaProdutos() {
    const[produtos, setProdutos] = useState([]);

    useEffect(() => {
        fetch("http://127.0.0.1:8000/produtos")
            .then((res) => res.jason())
            .then((data) => setProdutos(data.produtos));
 }, []);

 return (
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Quantidade</th>
                <th>Minimo</th>
               </tr>
            </thead>
            <tbody>
                {produtos.map((p) => (
                    <tr key={p[0]} className={p[3] <= p[4] ? "alerta" : ""}>
                        <td>{p[0]}</td>
                        <td>{p[1]}</td>
                        <td>{p[2]}</td>
                        <td>{p[3]}</td>
                        <td>{p[4]}</td>
                       </tr>
                    ))}
                </tbody>
              </table>
 );
}


export default TabelaProdutos;