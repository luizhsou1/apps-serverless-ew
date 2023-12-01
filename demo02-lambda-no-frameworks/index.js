async function handler(event, context) {
  console.log('event', JSON.stringify(event, null, 2))
  console.log('context', context)

  return {
    statusCode: 200,
    body: JSON.stringify({
      Hey: 'Jude!'
    })
  }
}

module.exports = {
  handler
}