module.exports.hello1 = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: "Hello World 1!"
      },
      null,
      2
    ),
  };
};

module.exports.hello2 = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: "Hello World 2!"
      },
      null,
      2
    ),
  };
};

module.exports.hello3 = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: "Hello World 3!"
      },
      null,
      2
    ),
  };
};
