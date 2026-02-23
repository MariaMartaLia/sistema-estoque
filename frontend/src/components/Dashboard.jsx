import CardResumo from "./CardResumo";
import TabelaProdutos from "./TabelaProdutos";
import FormMovimentacao from "./FormMovimentacao";

function Dashboard(){
   return (
    <div className="container">
        <h1> Sistema de Estoque</h1>

        <div className="cards">
         <CardResumo titulo="Produtos Ativos" valor="1" />
         <CardResumo titulo="Alertas" valor="0" />
         </div>

         <FormMovimentacao />
         <TabelaProdutos />
         </div>
       );    
    }    

 
    export default Dashboard;




