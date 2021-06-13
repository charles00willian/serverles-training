async function handler(event, context) {
  console.log('Ambiente..', JSON.stringify(process.env.null));
  console.log('evento..', JSON.stringify(event));
  
  return {
    hey: "word"
  }
}

module.exports = {
  handler,
}