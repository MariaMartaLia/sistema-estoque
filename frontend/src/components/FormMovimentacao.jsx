import {useState} from "react";

function FormMovimentacao() {
    const [produtoId, setProdutoId] = useState("");
    const [tipo, setTipo] = useState("entrada");
    const [quantidade, setQuantidade] = useState("")

    const enviar = async (e) => {
        e.preventDefault();

      await fetch("http://127.0.0.1:8000/movimentacoes", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    produto_id: Number(produtoId),
    tipo_movimentacao: tipo,
    quantidade: Number(quantidade),
  }),
});

  alert("Movimentação realizada!");
  window.location.reload();
};

return (
    <form onSubmit={enviar} className="form">
      <input
        type="number"
        placeholder="ID Produto"
        value={produtoId}
        onChange={(e) => setProdutoId(e.target.value)}
        required
        />

        <select value={tipo} onChange={(e) => setTipo(e.target.value)}>
            <option value="entrada">Entrada</option>
            <option value="saida">Saída</option>
            </select>

            <input
              type="number"
              placeholder="Quantidade"
              value={quantidade}
              onChange={(e) => setQuantidade(e.target.value)}
              required
              />

              <button type="submit"> Movimentar</button>
              </form>

);

}

export default FormMovimentacao;