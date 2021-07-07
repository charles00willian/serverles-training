class Handler {
  async main() {
    try {
      return {
        statusCode: 200,
        body: 'Hello'
      }
    } catch (e) {
      return {
        statusCode: 500,
        body: 'Internal Server Error'
      }
    }
  }
}

//factory
const handler = new Handler();
module.exports = handler.main.bind(handler);