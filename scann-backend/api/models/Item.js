module.exports = {
  attributes: {
    createdAt: false,
    updatedAt: false,
    name: {
      type: "string",
      required: true,
    },
    imageName: {
      type: "string",
      required: true,
    },
    expiration: {
      type: "string",
      required: true,
    },

    category: {
      model: "category",
    },
  },
};
