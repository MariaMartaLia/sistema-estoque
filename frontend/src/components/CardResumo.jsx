function CardResume ({ titulo, valor }) {
    return (
        <div className="card" >
            <h3>{titulo}</h3>
            <p>{valor}</p>
        </div>
    );
}

export default CardResume;